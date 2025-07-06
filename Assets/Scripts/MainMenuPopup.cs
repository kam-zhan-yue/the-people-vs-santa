using Kuroneko.UIDelivery;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MainMenuPopup : Popup
{
    [SerializeField] private Button startButton;
    [SerializeField] private Button continueButton;

    private StartPopup _startPopup;

    public void Init(StartPopup startPopup)
    {
        _startPopup = startPopup;
    }
    
    protected override void InitPopup()
    {
        startButton.onClick.AddListener(StartButtonPressed);
        continueButton.onClick.AddListener(ContinueButtonPressed);
    }

    private void StartButtonPressed()
    {
        SceneManager.LoadScene("Prologue");
    }

    private void ContinueButtonPressed()
    {
        _startPopup.ShowLevelSelect();
    }
}
