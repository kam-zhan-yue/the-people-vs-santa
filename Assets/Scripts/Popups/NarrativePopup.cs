using System.Collections.Generic;
using DG.Tweening;
using Kuroneko.UIDelivery;
using Kuroneko.UtilityDelivery;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.SceneManagement;
using Sequence = DG.Tweening.Sequence;

class FadeGroup
{
    public RectTransform group;
    public List<TextMeshProUGUI> texts = new();
}

public class NarrativePopup : Popup
{
    private const float FADE_TIME = 1.5f;
    private const float INTERVAL_TIME = 1f;
    [SerializeField] private string nextScene;
    [SerializeField] private List<RectTransform> groups = new();

    private readonly List<FadeGroup> _fadeGroups = new();

    protected override void InitPopup()
    {
        foreach (RectTransform group in groups)
        {
            FadeGroup fadeGroup = new();
            fadeGroup.group = group;
            foreach (Transform child in group)
                if (child.gameObject.TryGetComponent(out TextMeshProUGUI textMeshProUGUI))
                    fadeGroup.texts.Add(textMeshProUGUI);
            _fadeGroups.Add(fadeGroup);
        }

    }

    private void Start()
    {
        Sequence sequence = BuildSequence();
        sequence.Play().OnComplete(() => SceneManager.LoadScene(nextScene));
    }

    private Sequence BuildSequence()
    {
        Sequence sequence = DOTween.Sequence();

        foreach (FadeGroup fadeGroup in _fadeGroups)
        {
            // Fade in the text one by one
            Sequence fadeInSequence = DOTween.Sequence();
            foreach (TextMeshProUGUI text in fadeGroup.texts)
            {
                Color color = text.color;
                color.a = 0f;
                text.color = color;
                text.gameObject.SetActiveFast(true);
                fadeInSequence.Append(text.DOFade(1f, FADE_TIME));
            }
            
            // Fade out all of the text in one go
            Sequence fadeOutSequence = DOTween.Sequence();
            foreach (TextMeshProUGUI text in fadeGroup.texts)
            {
                fadeOutSequence.Join(text.DOFade(0f, 0.5f));
            }
            
            sequence.Append(fadeInSequence);
            sequence.AppendInterval(INTERVAL_TIME);
            sequence.Append(fadeOutSequence);
            sequence.AppendInterval(INTERVAL_TIME);
            sequence.AppendCallback(() => fadeGroup.group.gameObject.SetActiveFast(false));
        }
        return sequence;
    }
}
