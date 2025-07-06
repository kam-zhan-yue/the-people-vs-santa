using UnityEngine;

public class Introduction : Game
{
    protected override void Enter()
    {
        PlayerPrefs.SetInt("Introduction", 1);
    }
}
