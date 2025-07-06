using DG.Tweening;
using Kuroneko.UIDelivery;
using Kuroneko.UtilityDelivery;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GameOverPopup : Popup
{
    private const float FADE_OUT_TIME = 1.5f;
    
    [SerializeField] private Image background;
    [SerializeField] private Image foreground;
    [SerializeField] private RectTransform gameOverHolder;
    [SerializeField] private RectTransform restartHolder;
    [SerializeField] private Button restartButton;
    [SerializeField] private Button returnButton;
    
    private Game _game;
    
    public void Init(Game game)
    {
        _game = game;
    }
    
    protected override void InitPopup()
    {
        restartButton.onClick.AddListener(RestartButtonClicked);
        returnButton.onClick.AddListener(ReturnButtonClicked);
        HidePopup();
    }

    public override void ShowPopup()
    {
        gameOverHolder.gameObject.SetActiveFast(false);
        restartHolder.gameObject.SetActiveFast(false);
        SetTransparent(background);
        SetTransparent(foreground);
        
        base.ShowPopup();
        
        // If we have completed, then we want to fade into the next scene.
        if (_game.Completed)
        {
            if (!string.IsNullOrEmpty(_game.NextScene))
            {
                FadeOut(background).OnComplete(() =>
                {
                    SceneManager.LoadScene(_game.NextScene);
                });
            }
            else
            {
                FadeOut(background).OnComplete(() =>
                {
                    gameOverHolder.gameObject.SetActiveFast(true);
                });
            }
        }
        else
        {
            FadeOut(background).OnComplete(() =>
            {
                restartHolder.gameObject.SetActiveFast(true);
            });
        }
    }

    private void SetTransparent(Image image)
    {
        Color color = image.color;
        color.a = 0f;
        image.color = color;
    }

    private Sequence FadeOut(Image image)
    {
        Sequence sequence = DOTween.Sequence();
        sequence.Append(image.DOFade(1f, FADE_OUT_TIME)).SetEase(Ease.InOutQuad);
        return sequence;
    }
    

    private void RestartButtonClicked()
    {
        FadeOut(foreground).OnComplete(() =>
        {
            Debug.Log($"Restarting {SceneManager.GetActiveScene().name}");
            SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        });
    }

    private void ReturnButtonClicked()
    {
        FadeOut(foreground).OnComplete(() =>
        {
            SceneManager.LoadScene("Start");
        });
    }
}
