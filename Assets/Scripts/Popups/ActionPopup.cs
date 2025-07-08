using Kuroneko.UIDelivery;
using Kuroneko.UtilityDelivery;
using UnityEngine;
using UnityEngine.UI;

public enum ActionState
{
    Choices,
    Evidence,
}

public class ActionPopup : Popup
{
    [SerializeField] private ChoiceSelectPopup choiceSelectPopup;
    [SerializeField] private EvidencePopup evidencePopup;
    [SerializeField] private EvidenceSelectPopup evidenceSelectPopup;
    [SerializeField] private TestimonyPopup testimonyPopup;
    [SerializeField] private Button testimonyButton;
    [SerializeField] private Button evidenceButton;

    private Game _game;
    private ActionState _state = ActionState.Choices;

    public void Init(Game game)
    {
        _game = game;
        choiceSelectPopup.Init(this, _game);
        evidencePopup.Init(this, _game);
        evidenceSelectPopup.Init(this, _game);
        testimonyPopup.Init(this, _game);
    }

    protected override void InitPopup()
    {
        choiceSelectPopup.HidePopup();
        evidencePopup.HidePopup();
        evidenceSelectPopup.HidePopup();
        testimonyPopup.HidePopup();
        testimonyButton.onClick.AddListener(TestimonyButtonClicked);
        evidenceButton.onClick.AddListener(EvidenceButtonClicked);
        HideButtons();
        HidePopup();
    }

    public void ShowChoices()
    {
        ShowPopup();
        _state = ActionState.Choices;
        choiceSelectPopup.ShowPopup();
        evidencePopup.HidePopup();
        testimonyPopup.HidePopup();
        evidenceSelectPopup.HidePopup();
        ShowButtons();
    }

    public void ShowEvidence(string evidence)
    {
        ShowPopup();
        evidencePopup.Show(evidence);
        HideButtons();
    }

    public void ShowEvidenceSelect()
    {
        ShowPopup();
        _state = ActionState.Evidence;
        choiceSelectPopup.HidePopup();
        evidenceSelectPopup.HidePopup();
        evidencePopup.HidePopup();
        testimonyPopup.HidePopup();
        ShowButtons();
    }

    private void ShowTestimony()
    {
        testimonyPopup.ShowPopup();
        choiceSelectPopup.HidePopup();
        evidencePopup.HidePopup();
        evidenceSelectPopup.HidePopup();
        HideButtons();
    }

    private void ShowButtons()
    {
        testimonyButton.gameObject.SetActiveFast(true);
        evidenceButton.gameObject.SetActiveFast(true);
    }

    private void HideButtons()
    {
        testimonyButton.gameObject.SetActiveFast(false);
        evidenceButton.gameObject.SetActiveFast(false);
    }

    private void TestimonyButtonClicked()
    {
        ShowTestimony();
    }

    private void EvidenceButtonClicked()
    {
        evidenceSelectPopup.Show(_state == ActionState.Evidence);
        HideButtons();
    }

    public void EvidenceBackButtonClicked()
    {
        if (_state == ActionState.Choices)
        {
            ShowChoices();
        }
        else
        {
            evidenceSelectPopup.HidePopup();
            ShowButtons();
        }
    }

    public void TestimonyBackButtonClicked()
    {
        if (_state == ActionState.Choices)
        {
            ShowChoices();
        }
        else
        {
            testimonyPopup.HidePopup();
            ShowButtons();
        }
    }

    public void ChoiceSelected()
    {
        choiceSelectPopup.HidePopup();
        HideButtons();
        HidePopup();
    }

    public void EvidenceSelected()
    {
        evidenceSelectPopup.HidePopup();
        HideButtons();
        HidePopup();
    }

    public void OkayButtonClicked()
    {
        evidencePopup.HidePopup();
        HideButtons();
        HidePopup();
    }
}
