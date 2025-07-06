using UnityEngine;

[CreateAssetMenu(menuName = "ScriptableObjects/Testimony", fileName = "New Testimony")]
public class Testimony : ScriptableObject
{
    [TextArea(10, 20)]
    public string testimony;
}
