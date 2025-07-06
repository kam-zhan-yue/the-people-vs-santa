using UnityEngine;
using UnityEngine.Serialization;

[CreateAssetMenu(menuName = "ScriptableObjects/Evidence", fileName = "New Evidence")]
public class Evidence : ScriptableObject
{
    public string displayName;
    public Sprite image;
    public string description;
}
