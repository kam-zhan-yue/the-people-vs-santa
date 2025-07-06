using Kuroneko.UIDelivery;
using Kuroneko.UtilityDelivery;
using UnityEngine;
using UnityEngine.Serialization;

public class ActionPopup : Popup
{
    [SerializeField] private ChoiceSelectPopup choiceSelectPopup;
    [SerializeField] private EvidencePopup evidencePopup;
    [SerializeField] private EvidenceSelectPopup evidenceSelectPopup;
    [SerializeField] private TestimonyPopup testimonyPopup;

    private Game _game;

    public void Init(Game game)
    {
        _game = game;
        choiceSelectPopup.Init(this, _game);
        evidencePopup.Init(this, _game);
        evidenceSelectPopup.Init(this, _game);
        testimonyPopup.Init(this);
    }

    protected override void InitPopup()
    {
        choiceSelectPopup.HidePopup();
        evidencePopup.HidePopup();
        evidenceSelectPopup.HidePopup();
        testimonyPopup.HidePopup();
    }

    public void ShowChoices()
    {
        choiceSelectPopup.ShowPopup();
        evidencePopup.HidePopup();
        testimonyPopup.HidePopup();
    }

    public void ShowEvidence(string evidence)
    {
        evidencePopup.Show(evidence);
    }

    public void ShowEvidenceSelect(bool intractable)
    {
        choiceSelectPopup.HidePopup();
        evidencePopup.ShowPopup();
        testimonyPopup.HidePopup();
    }

    public void ShowTestimony()
    {
        choiceSelectPopup.HidePopup();
        evidencePopup.HidePopup();
        testimonyPopup.ShowPopup();
    }
}
