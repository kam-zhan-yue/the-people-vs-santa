using Kuroneko.UIDelivery;
using UnityEngine;
using UnityEngine.UI;

public class ChoiceSelectPopup : Popup
{
    [SerializeField] private ChoiceSelectPopupItem samplePopupItem;
    [SerializeField] private RectTransform choiceHolder;
    [SerializeField] private Button testimonyButton;
    [SerializeField] private Button evidenceButton;

    private ActionPopup _actionPopup;
    
    public void Init(ActionPopup actionPopup)
    {
        _actionPopup = actionPopup;
    }
    
    protected override void InitPopup()
    {
        testimonyButton.onClick.AddListener(TestimonyButtonClicked);
        testimonyButton.onClick.AddListener(EvidenceButtonClicked);
    }

    public override void ShowPopup()
    {
        base.ShowPopup();
        TryInstantiate();
        
    }

    private void TryInstantiate()
    {
        
    }

    private void TestimonyButtonClicked()
    {
        
    }

    private void EvidenceButtonClicked()
    {
        
    }
}
