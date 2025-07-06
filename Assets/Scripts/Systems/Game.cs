using System.Collections.Generic;
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
    private const string TESTIFY = "TESTIFY";
    private const string CROSS_EXAMINATION = "CROSS_EXAMINATION";

    public GameDatabase database;
    public List<Evidence> startingEvidence = new();
    [SerializeField] private TextAsset inkFile;
    [SerializeField] private DialoguePopup dialoguePopup;
    [SerializeField] private ActionPopup actionPopup;

    private List<Evidence> _currentEvidence = new();

    public GameState State { get; private set; } = GameState.Dialogue;
    
    private Story _inkStory;

    protected abstract void Enter();

    protected virtual void Awake()
    {
        dialoguePopup.Init(this);
        actionPopup.Init(this);
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

    protected virtual void Start()
    {
        Enter();
        _inkStory = new Story(inkFile.text);
        Continue();
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
    }

    private void ProcessLine(string line)
    {
        string[] splits = line.Split(':', 2);
        if (splits.Length < 2)
        {
            Debug.LogError($"Could not process {line}");
            dialoguePopup.ShowDialogue(string.Empty, line);
            return;
        }

        string lineOne = splits[0].Trim();
        string lineTwo = splits[1].Trim();
        if (lineOne.StartsWith(EVIDENCE))
        {
            State = GameState.Evidence;
            AddEvidence(lineTwo);
            actionPopup.ShowEvidence(lineTwo);
        }
        else if (lineOne.StartsWith(EVENT))
        {
            ProcessEvent(lineTwo);
        }
        else
        {
            State = GameState.Dialogue;
            dialoguePopup.ShowDialogue(lineOne, lineTwo);
        }
    }

    private void ProcessEvent(string eventId)
    {
        if (eventId == TESTIFY)
        {
            // TODO: Make a flashy title here
            _inkStory.Continue();
        }
        else if (eventId == CROSS_EXAMINATION)
        {
            // TODO: Make a flashy title here
            _inkStory.Continue();
        }
        else if (eventId == EVIDENCE)
        {
            actionPopup.ShowEvidenceSelect(true);
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
        actionPopup.ShowChoices();
    }

    public void Choose(Evidence evidence)
    {
        List<Choice> choices = _inkStory.currentChoices;
        foreach (Choice choice in choices)
        {
            if (choice.text == evidence.name)
            {
                _inkStory.ChooseChoiceIndex(choice.index);
                return;
            }
        }
        Debug.LogError($"Could not choose {evidence.name!}");
    }

    public void Choose(Choice choice)
    {
        _inkStory.ChooseChoiceIndex(choice.index);
        Continue();
    }
}
