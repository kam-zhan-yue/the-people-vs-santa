using DG.Tweening;
using Kuroneko.AudioDelivery;
using Kuroneko.UIDelivery;
using Kuroneko.UtilityDelivery;
using Sirenix.OdinInspector;
using UnityEngine;

public class Popups : Popup
{
    [SerializeField] private float shakeDuration = 0.2f;
    [SerializeField] private float shakeStrength = 5f;
    [SerializeField] private int shakeVibrato = 20;
    [SerializeField] private SpeakerPopup speakerPopup;
    [SerializeField] private DialoguePopup dialoguePopup;
    [SerializeField] private ActionPopup actionPopup;
    [SerializeField] private GameOverPopup gameOverPopup;

    public DialoguePopup DialoguePopup => dialoguePopup;
    public SpeakerPopup SpeakerPopup => speakerPopup;
    public ActionPopup ActionPopup => actionPopup;
    public GameOverPopup GameOverPopup => gameOverPopup;
    
    private Vector2 _originalPosition;

    protected override void InitPopup()
    {
        _originalPosition = mainHolder.anchoredPosition;
    }

    public void Init(Game game)
    {
        speakerPopup.Init(game);
        dialoguePopup.Init(game);
        actionPopup.Init(game);
        gameOverPopup.Init(game);
    }

    public void CheckEndGame()
    {
        speakerPopup.HidePopup();
        dialoguePopup.HidePopup();
        actionPopup.HidePopup();
        gameOverPopup.ShowPopup();
    }

    [Button]
    public void Shake()
    {
        // Shake Tween
        mainHolder.DOKill();
        mainHolder.DOShakePosition(
            duration: shakeDuration,
            strength: new Vector3(shakeStrength, shakeStrength, 0f),
            vibrato: shakeVibrato,
            randomness: 90f,
            snapping: false,
            fadeOut: true
        )
        .OnKill(() =>
        {
            mainHolder.anchoredPosition = _originalPosition;
        })
        .OnComplete(() =>
        {
            mainHolder.anchoredPosition = _originalPosition;
        });;
        
        // Shake Audio
        ServiceLocator.Instance.Get<IAudioService>().Play("SHAKE");
    }
}
