using Kuroneko.UtilityDelivery;
using UnityEngine;
using UnityEngine.UI;

public class EvidenceSelectPopupItem : PopupItem
{
    private readonly Color _selectColour = new Color(0.5f, 0.9f, 0.2f);
    [SerializeField] private Image tileImage;
    [SerializeField] private Image evidenceImage;
    public Evidence Evidence { get; private set; }
    private EvidenceSelectPopup _popup;
    
    public void Init(EvidenceSelectPopup popup)
    {
        _popup = popup;
    }
    
    public void Show(Evidence evidence)
    {
        Evidence = evidence;
        if (evidence)
        {
            evidenceImage.gameObject.SetActiveFast(true);
            evidenceImage.sprite = evidence.image;
        }
    }

    public void OnClick()
    {
        if (Evidence)
        {
            _popup.Select(this);
        }
    }

    public void SetEmpty()
    {
        tileImage.color = Color.white;
        evidenceImage.gameObject.SetActiveFast(false);
        Evidence = null;
    }

    public void Select()
    {
        tileImage.color = _selectColour;
    }

    public void UnSelect()
    {
        tileImage.color = Color.white;
    }
}
