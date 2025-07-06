using System.Collections.Generic;
using Cysharp.Threading.Tasks;
using Ink.Runtime;
using Kuroneko.UtilityDelivery;
using UnityEngine;

public enum GameState
{
    Dialogue,
    Evidence,
    ChoiceSelect,
    EvidenceSelect,
}

public abstract class Game : MonoBehaviour
{
    private const string EVIDENCE = "EVIDENCE";
    private const string EVENT = "EVENT";
    private const string SHAKE = "SHAKE";
    private const string TESTIFY = "TESTIFY";
    private const string CROSS_EXAMINATION = "CROSS_EXAMINATION";

    public GameDatabase database;
    public List<Evidence> startingEvidence = new();
    [SerializeField] private TextAsset inkFile;
    [SerializeField] private Popups popups;
    [SerializeField] private string nextScene;

    private List<Evidence> _currentEvidence = new();
    public bool Completed { get; private set; } = false;
    public string NextScene => nextScene;

    public string TestimonyID { get; private set; }

    public GameState State { get; private set; } = GameState.Dialogue;
    
    private Story _inkStory;

    protected abstract void Enter();

    protected virtual void Awake()
    {
        popups.Init(this);
        foreach (Evidence evidence in startingEvidence)
            _currentEvidence.Add(evidence);
    }

    public List<Evidence> GetEvidence()
    {
        return _currentEvidence;
    }

    public List<Choice> GetChoices()
    {
        return _inkStory.currentChoices;
    }

    public List<string> GetCurrentTags()
    {
        return _inkStory.currentTags;
    }

    protected virtual void Start()
    {
        Init();
        Continue();
    }

    private void Init()
    {
        Enter();
        _inkStory = new Story(inkFile.text);
        _inkStory.BindExternalFunction("complete", SetCompleted);
    }

    public void Continue()
    {
        if (_inkStory.canContinue)
        {
            string line = _inkStory.Continue();
            ProcessLine(line);
        }
        else if (_inkStory.currentChoices.Count > 0)
        {
            ProcessChoices();
        }
        else
        {
            popups.CheckEndGame();
        }
    }

    private void ProcessLine(string line)
    {
        string[] splits = line.Split(':', 2);
        if (splits.Length < 2)
        {
            Debug.LogError($"Could not process {line}");
            popups.DialoguePopup.ShowDialogue(string.Empty, line);
            return;
        }

        string lineOne = splits[0].Trim();
        string lineTwo = splits[1].Trim();
        if (lineOne.StartsWith(EVIDENCE))
        {
            State = GameState.Evidence;
            AddEvidence(lineTwo);
            popups.ActionPopup.ShowEvidence(lineTwo);
        }
        else if (lineOne.StartsWith(EVENT))
        {
            ProcessEvent(lineTwo);
        }
        else
        {
            State = GameState.Dialogue;
            popups.SpeakerPopup.Show(lineOne);
            popups.DialoguePopup.ShowDialogue(lineOne, lineTwo);
        }
    }

    private void ProcessEvent(string eventId)
    {
        if (eventId.StartsWith(TESTIFY))
        {
            string[] splits = eventId.Split(':', 2);
            if (splits.Length < 2)
            {
                Debug.LogError($"Could not process TESTIFY at {eventId}");
                Continue();
            }
            else
            {
                TestimonyID = splits[1];
                Continue();
            }
        }
        else if (eventId.StartsWith(CROSS_EXAMINATION))
        {
            // TODO: Make a flashy title here
            _inkStory.Continue();
        }
        else if (eventId.StartsWith(SHAKE))
        {
            popups.Shake();
            Continue();
        }
        else if (eventId.StartsWith(EVIDENCE))
        {
            State = GameState.EvidenceSelect;
            popups.ActionPopup.ShowEvidenceSelect(true);
        }
        else
        {
            Debug.LogError($"Error processing event {eventId}");
        }
    }

    private void AddEvidence(string id)
    {
        if (database.TryGetEvidence(id, out Evidence evidence))
            _currentEvidence.AddOnce(evidence);
    }

    private void ProcessChoices()
    {
        State = GameState.ChoiceSelect;
        popups.ActionPopup.ShowChoices();
    }

    public async UniTask Choose(Evidence evidence)
    {
        List<Choice> choices = _inkStory.currentChoices;
        foreach (Choice choice in choices)
        {
            if (choice.text == evidence.name)
            {
                _inkStory.ChooseChoiceIndex(choice.index);
                await UniTask.WaitForEndOfFrame();
                Continue();
                return;
            }
        }
        Debug.LogError($"Could not choose {evidence.name!}");
    }

    public async UniTask Choose(Choice choice)
    {
        _inkStory.ChooseChoiceIndex(choice.index);
        /*
         * When we select here, there is a race condition.
         * Choose() and DialoguePopup.Update.
         * In order to avoid this, we will wait a frame before setting the next state
         * So that DialoguePopup.Update doesn't consume input
         */
        await UniTask.WaitForEndOfFrame();
        Continue();
    }

    private void SetCompleted()
    {
        Completed = true;
    }
}
