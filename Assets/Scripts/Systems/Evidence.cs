using UnityEngine;

[CreateAssetMenu(menuName = "ScriptableObjects/Evidence", fileName = "New Evidence")]
public class Evidence : ScriptableObject
{
    public string displayName;
    public Sprite image;
    [TextArea(5, 10)]
    public string description;
}
