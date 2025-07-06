using Kuroneko.UIDelivery;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class LevelSelectPopup : Popup
{
    [SerializeField] private Button prologueButton;
    [SerializeField] private Button santaButton;
    [SerializeField] private Button caseOneButton;
    [SerializeField] private Button prancerButton;
    [SerializeField] private Button caseTwoButton;
    [SerializeField] private Button backButton;

    private StartPopup _startPopup;

    public void Init(StartPopup startPopup)
    {
        _startPopup = startPopup;
    }
    
    protected override void InitPopup()
    {
        prologueButton.onClick.AddListener(() => StartScene("Prologue"));
        santaButton.onClick.AddListener(() => StartScene("Introduction"));
        caseOneButton.onClick.AddListener(() => StartScene("Case One"));
        prancerButton.onClick.AddListener(() => StartScene("Event"));
        caseTwoButton.onClick.AddListener(() => StartScene("Case Two"));
        backButton.onClick.AddListener(BackButtonPressed);

        prologueButton.enabled = PlayerPrefs.HasKey("Prologue");
        santaButton.enabled = PlayerPrefs.HasKey("Introduction");
        caseOneButton.enabled = PlayerPrefs.HasKey("Case One");
        prologueButton.enabled = PlayerPrefs.HasKey("Event");
        caseTwoButton.enabled = PlayerPrefs.HasKey("Case Two");
    }

    private void StartScene(string sceneName)
    {
        SceneManager.LoadScene(sceneName);
    }

    private void BackButtonPressed()
    {
        _startPopup.ShowMainMenu();
    }
}
