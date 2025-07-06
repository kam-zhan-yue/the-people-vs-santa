using DG.Tweening;
using Kuroneko.UIDelivery;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class EvidencePopup : Popup
{
    [SerializeField] private Image image;
    [SerializeField] private TMP_Text displayName;
    [SerializeField] private TMP_Text description;
    [SerializeField] private Button okayButton;
    
    
    private ActionPopup _actionPopup;
    private Game _game;
    
    public void Init(ActionPopup actionPopup, Game game)
    {
        _actionPopup = actionPopup;
        _game = game;
    }
    
    protected override void InitPopup()
    {
        okayButton.onClick.AddListener(OkayButtonClicked);
    }

    public void Show(string id)
    {
        ShowPopup();
        if(_game.database.TryGetEvidence(id, out Evidence evidence))
        {
            image.sprite = evidence.image;
            displayName.SetText(evidence.displayName);
            description.SetText(evidence.description);
        }
        else
        {
            displayName.SetText("MISSING");
            description.SetText($"Could not find {id}");
        }
    }

    private void OkayButtonClicked()
    {
        HidePopup();
        _game.Continue();
    }
}
