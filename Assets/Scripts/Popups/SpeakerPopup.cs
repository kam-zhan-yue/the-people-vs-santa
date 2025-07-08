using System;
using System.Collections.Generic;
using Kuroneko.UIDelivery;
using Kuroneko.UtilityDelivery;
using UnityEngine;
using UnityEngine.UI;

[Serializable]
public class Photo
{
    public string id;
    public Sprite image;
}

public class SpeakerPopup : Popup
{
    [SerializeField] private Photo[] photos = Array.Empty<Photo>();
    [SerializeField] private Image background;
    [SerializeField] private Image main;
    [SerializeField] private Image foreground;
    [SerializeField] private Image photo;
    [SerializeField] private RectTransform filter;
    
    private Game _game;

    public void Init(Game game)
    {
        _game = game;
    }
    
    protected override void InitPopup()
    {
        background.gameObject.SetActiveFast(false);
        foreground.gameObject.SetActiveFast(false);
        main.gameObject.SetActiveFast(false);
        filter.gameObject.SetActiveFast(false);
        photo.gameObject.SetActiveFast(false);
    }

    public void ShowPhoto(string id)
    {
        if (id == "HIDE")
        {
            photo.gameObject.SetActiveFast(false);
            filter.gameObject.SetActiveFast(false);
            return;
        }
        
        for (int i = 0; i < photos.Length; ++i)
        {
            if (photos[i].id == id && photos[i].image)
            {
                filter.gameObject.SetActiveFast(true);
                photo.gameObject.SetActiveFast(true);
                photo.sprite = photos[i].image;
            }
        }
    }

    public void Show(string speakerId)
    {
        if (_game.database.TryGetSpeaker(speakerId, out Speaker speaker))
        {
            SetImage(background, speaker.background);
            SetImage(foreground, speaker.foreground);
            SetImage(main, speaker.main);
            CheckTags(speaker);
        }
        else
        {
            Debug.Log($"Unable to process speaker {speakerId}");
        }
    }

    private void SetImage(Image image, Sprite sprite)
    {
        image.gameObject.SetActiveFast(sprite);
        image.sprite = sprite;
    }

    private void CheckTags(Speaker speaker)
    {
        List<string> tags = _game.GetCurrentTags();
        Dictionary<string, SpeakerExpression> expressionDict = speaker.GetExpressionDictionary();
        for (int i = 0; i < tags.Count; ++i)
        {
            if (expressionDict.TryGetValue(tags[i], out SpeakerExpression expression))
            {
                SetImage(main, expression.image);
            }
        }
    }
}
