using System.Collections.Generic;
using Ink.Runtime;
using UnityEngine;

public abstract class Game : MonoBehaviour
{
    private const string ACTION_EVIDENCE = "EVIDENCE";

    public GameDatabase database;
    [SerializeField] private TextAsset inkFile;
    [SerializeField] private DialoguePopup dialoguePopup;
    [SerializeField] private ActionPopup actionPopup;
    
    private Story _inkStory;

    protected abstract void Enter();

    protected virtual void Awake()
    {
        dialoguePopup.Init(this);
        actionPopup.Init(this);
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
            ProcessChoices(_inkStory.currentChoices);
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
        
        if (splits[0].StartsWith(ACTION_EVIDENCE))
        {
            actionPopup.ShowEvidence(splits[1]);
        }
        else
        {
            dialoguePopup.ShowDialogue(splits[0], splits[1]);
        }
    }

    private void ProcessChoices(List<Choice> choices)
    {
    }
}
