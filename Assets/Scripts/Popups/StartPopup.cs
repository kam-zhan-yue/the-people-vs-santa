using Kuroneko.UIDelivery;
using Kuroneko.UtilityDelivery;
using UnityEngine;

public class StartPopup : Popup
{
    [SerializeField] private MainMenuPopup mainMenuPopup;
    [SerializeField] private LevelSelectPopup levelSelectPopup;
    
    protected override void InitPopup()
    {
        mainMenuPopup.Init(this);
        levelSelectPopup.Init(this);
        ShowMainMenu();
    }

    public void ShowMainMenu()
    {
        mainMenuPopup.gameObject.SetActiveFast(true);
        levelSelectPopup.gameObject.SetActiveFast(false);
    }
    
    public void ShowLevelSelect()
    {
        mainMenuPopup.gameObject.SetActiveFast(false);
        levelSelectPopup.gameObject.SetActiveFast(true);
    }
}
