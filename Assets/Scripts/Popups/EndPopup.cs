using Kuroneko.AudioDelivery;
using Kuroneko.UIDelivery;
using Kuroneko.UtilityDelivery;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class EndPopup : Popup
{
    [SerializeField] private RectTransform endScreen;
    [SerializeField] private RectTransform music;
    [SerializeField] private RectTransform credits;
    [SerializeField] private Button returnToMenu;
    
    protected override void InitPopup()
    {
        endScreen.gameObject.SetActiveFast(true);
        music.gameObject.SetActiveFast(false);
        credits.gameObject.SetActiveFast(false);
        returnToMenu.onClick.AddListener(ReturnToMenu);
    }

    private void Start()
    {
        ServiceLocator.Instance.Get<IAudioService>().Play("END");
    }

    private void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            if (endScreen.gameObject.activeSelf)
            {
                endScreen.gameObject.SetActiveFast(false);
                music.gameObject.SetActiveFast(true);
            } 
            else if (music.gameObject.activeSelf)
            {
                music.gameObject.SetActiveFast(false);
                credits.gameObject.SetActiveFast(true);
            }
            else if (credits.gameObject.activeSelf)
            {
                returnToMenu.gameObject.SetActiveFast(true);
            }
        }
    }

    private void ReturnToMenu()
    {
        ServiceLocator.Instance.Get<IAudioService>().Stop("END");
        SceneManager.LoadScene("Start");
    }
}
