using System;
using System.Collections.Generic;
using Kuroneko.UIDelivery;
using Kuroneko.UtilityDelivery;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

[Serializable]
public class Scene
{
    public Sprite background;
    public Sprite main;
    public Sprite foreground;
}

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
    [SerializeField] private RectTransform window;
    [SerializeField] private Image windowImage;
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
        window.gameObject.SetActiveFast(false);
    }

    public void PreStart(Scene scene)
    {
        SetImage(background, scene.background);
        SetImage(main, scene.main);
        SetImage(foreground, scene.foreground);
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
        if (!_game.database.TryGetSpeaker(speakerId, out Speaker speaker))
        {
            Debug.LogError($"Unable to process speaker {speakerId}");
        }
        
        // If it is us in the interrogation room, show the window instead
        if (speakerId == "You" && SceneManager.GetActiveScene().name == "Introduction")
        {
            window.gameObject.SetActiveFast(true);
            windowImage.sprite = speaker.main;
            SetImage(windowImage, speaker.head);
        }
        else
        {
            window.gameObject.SetActiveFast(false);
            SetImage(main, speaker.main);
            CheckTags(main, speaker);
            SetImage(background, speaker.background);
            SetImage(foreground, speaker.foreground);
        }
    }

    private void SetImage(Image image, Sprite sprite)
    {
        image.gameObject.SetActiveFast(sprite);
        image.sprite = sprite;
    }

    private void CheckTags(Image image, Speaker speaker)
    {
        List<string> tags = _game.GetCurrentTags();
        Dictionary<string, SpeakerExpression> expressionDict = speaker.GetExpressionDictionary();
        for (int i = 0; i < tags.Count; ++i)
        {
            if (expressionDict.TryGetValue(tags[i], out SpeakerExpression expression))
            {
                SetImage(image, expression.image);
            }
        }
    }
}
