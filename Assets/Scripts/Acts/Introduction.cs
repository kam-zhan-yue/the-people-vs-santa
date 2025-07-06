using UnityEngine;

public class Introduction : MonoBehaviour
{
    [SerializeField] private TextAsset inkFile;
    private void Awake()
    {
        PlayerPrefs.SetInt("Santa", 1);
    }

    private void Start()
    {
        
    }
}
