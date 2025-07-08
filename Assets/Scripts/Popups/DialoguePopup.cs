using DG.Tweening;
using Kuroneko.AudioDelivery;
using Kuroneko.UIDelivery;
using Kuroneko.UtilityDelivery;
using TMPro;
using UnityEngine;

public class DialoguePopup : Popup
{
    private const float THRESHOLD = 0.15f;
    private const float READ_TIME = 0.5f;
    
    [SerializeField] private TMP_Text nameText;
    [SerializeField] private TMP_Text dialogueText;
    [SerializeField] private TMP_Text autoPlayingText;

    private Game _game;
    private Tween _typeTween;
    private bool _isTyping = false;
    private string _talkId = string.Empty;
    private float _downTimer = 0f;
    private float _autoPlayTimer = 0f;

    private const float TYPE_SPEED = 0.02f;

    private bool _autoPlaying = false;

    protected override void InitPopup()
    {
        autoPlayingText.gameObject.SetActiveFast(false);
    }

    public void Init(Game game)
    {
        _game = game;
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Q))
        {
            ToggleAutoPlay();
        }
        
        if (_game.State != GameState.Dialogue)
            return;
        
        if (IsDown())
            ServiceLocator.Instance.Get<IAudioService>().Play("CLICK");
        
        if (_autoPlaying)
        {
            AutoPlay();
            return;
        }
        
        if (IsDown())
        {
            if (_isTyping)
            {
                FinishTyping();
            }
            else
            {
                _game.Continue();
            }
        }

        if (IsHeldDown())
        {
            _downTimer += Time.deltaTime;
            if (_downTimer >= THRESHOLD)
            {
                // Instantly 
                if (_isTyping)
                {
                    ServiceLocator.Instance.Get<IAudioService>().Play("CLICK");
                    FinishTyping();
                }
                else if (_downTimer >= THRESHOLD + READ_TIME)
                {
                    ServiceLocator.Instance.Get<IAudioService>().Play("CLICK");
                    _game.Continue();
                    _downTimer = THRESHOLD;
                }
            }
        }
        else
        {
            _downTimer = 0f;
        }
    }

    private void ToggleAutoPlay()
    {
        _autoPlayTimer = 0f;
        _autoPlaying = !_autoPlaying;
        autoPlayingText.gameObject.SetActiveFast(_autoPlaying);
    }

    private void AutoPlay()
    {
        if (!_isTyping)
        {
            _autoPlayTimer += Time.deltaTime;
            if (_autoPlayTimer >= READ_TIME)
            {
                ServiceLocator.Instance.Get<IAudioService>().Play("CLICK");
                _game.Continue();
                _autoPlayTimer = 0f;
            }
        }
    }

    private void FinishTyping()
    {
        _typeTween.Kill();
        dialogueText.maxVisibleCharacters = dialogueText.textInfo.characterCount;
        _isTyping = false;
        StopAudio();
    }
    

    private bool IsDown()
    {
        return Input.GetMouseButtonDown(0) || Input.GetKeyDown(KeyCode.Space);
    }

    private bool IsHeldDown()
    {
        return Input.GetMouseButton(0) || Input.GetKey(KeyCode.Space);
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
            FinishTyping();
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
