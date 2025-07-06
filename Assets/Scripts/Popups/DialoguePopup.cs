using DG.Tweening;
using Kuroneko.AudioDelivery;
using Kuroneko.UIDelivery;
using Kuroneko.UtilityDelivery;
using TMPro;
using UnityEngine;

public class DialoguePopup : Popup
{
    [SerializeField] private TMP_Text nameText;
    [SerializeField] private TMP_Text dialogueText;

    private Game _game;
    private Tween _typeTween;
    private bool _isTyping = false;
    private string _talkId = string.Empty;

    private const float TYPE_SPEED = 0.02f;

    public void Init(Game game)
    {
        _game = game;
    }

    private void Update()
    {
        if (_game.State != GameState.Dialogue)
            return;
        
        if (Input.GetMouseButtonDown(0) || Input.GetKeyDown(KeyCode.Space))
        {
            if (_isTyping)
            {
                _typeTween.Kill();
                dialogueText.maxVisibleCharacters = dialogueText.textInfo.characterCount;
                _isTyping = false;
                StopAudio();
            }
            else
            {
                _game.Continue();
            }
        }
    }

    protected override void InitPopup()
    {
        // Example: add click listener here if you want
        // e.g. GetComponent<Button>().onClick.AddListener(OnClick);
    }

    public void ShowDialogue(string speaker, string line)
    {
        SetSpeaker(speaker);
        PlayDialogue(line);
        PlayAudio(speaker);
    }

    private void SetSpeaker(string speaker)
    {
        nameText.gameObject.SetActiveFast(!string.IsNullOrEmpty(speaker));
        nameText.SetText(speaker);
    }

    private void PlayDialogue(string dialogue)
    {
        string line = dialogue.Trim();
        dialogueText.text = line;
        dialogueText.maxVisibleCharacters = 0;

        _isTyping = true;

        // Kill existing tween
        _typeTween?.Kill();
        

        _typeTween = DOTween.To(
            () => dialogueText.maxVisibleCharacters,
            x => dialogueText.maxVisibleCharacters = x,
            line.Length,
            line.Length * TYPE_SPEED
        )
        .SetEase(Ease.Linear)
        .OnComplete(() =>
        {
            _isTyping = false;
            StopAudio();
        });
    }

    private void PlayAudio(string speakerId)
    {
        if (_game.database.TryGetSpeaker(speakerId, out Speaker speaker))
        {
            _talkId = speaker.talkId;
            ServiceLocator.Instance.Get<IAudioService>().Play(_talkId);
        }
    }

    private void StopAudio()
    {
        if (!string.IsNullOrEmpty(_talkId))
        {
            ServiceLocator.Instance.Get<IAudioService>().Stop(_talkId);
            _talkId = string.Empty;
        }
    }
}
