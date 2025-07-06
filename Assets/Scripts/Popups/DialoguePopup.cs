using Kuroneko.UIDelivery;
using TMPro;
using UnityEngine;
using DG.Tweening;
using Kuroneko.UtilityDelivery;

public class DialoguePopup : Popup
{
    [SerializeField] private TMP_Text nameText;
    [SerializeField] private TMP_Text dialogueText;

    private Game _game;
    private Tween _typeTween;
    private bool _isTyping = false;

    private const float TYPE_SPEED = 0.02f;

    public void Init(Game game)
    {
        _game = game;
    }

    private void Update()
    {
        if (Input.GetMouseButtonDown(0) || Input.GetKeyDown(KeyCode.Space))
        {
            if (_isTyping)
            {
                _typeTween.Kill();
                dialogueText.maxVisibleCharacters = dialogueText.textInfo.characterCount;
                _isTyping = false;
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
        });
    }
}
