using DG.Tweening;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class TutorialPopup : MonoBehaviour
{
    private const float FADE_OUT_TIME = 1f;
    [SerializeField] private string nextScene;
    [SerializeField] private Image foreground;

    private bool _animating = false;
    
    private void Update()
    {
        if (_animating)
            return;
        
        if (Input.GetMouseButtonDown(0) || Input.GetKeyDown(KeyCode.Space))
        {
            Animate();
        }
    }

    private void Animate()
    {
        _animating = true;
        Sequence sequence = DOTween.Sequence();
        sequence.Append(foreground.DOFade(1f, FADE_OUT_TIME)).SetEase(Ease.InOutQuad).OnComplete(() =>
        {
            SceneManager.LoadScene(nextScene);
        });
    }
}
