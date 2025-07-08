using System;
using System.Collections.Generic;
using Kuroneko.AudioDelivery;
using Sirenix.OdinInspector;
using UnityEngine;

[Serializable]
public class SpeakerExpression
{
    public string id;
    public Sprite image;
}

[CreateAssetMenu(menuName = "ScriptableObjects/Speaker", fileName = "New Speaker")]
public class Speaker : ScriptableObject
{
    public string displayName;

    public string talkId;
    public Sprite background;
    public Sprite main;
    public Sprite head;
    public Sprite foreground;
    
    [TableList] public List<SpeakerExpression> expressions = new();

    public Dictionary<string, SpeakerExpression> GetExpressionDictionary()
    {
        Dictionary<string, SpeakerExpression> dict = new();
        foreach (SpeakerExpression expression in expressions)
            dict.Add(expression.id, expression);
        return dict;
    }
}