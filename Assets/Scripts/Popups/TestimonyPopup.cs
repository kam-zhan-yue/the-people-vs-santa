using Kuroneko.UIDelivery;
using UnityEngine;

public class TestimonyPopup : Popup
{
    private ActionPopup _actionPopup;
    
    public void Init(ActionPopup actionPopup)
    {
        _actionPopup = actionPopup;
    }

    protected override void InitPopup()
    {
    }
}
