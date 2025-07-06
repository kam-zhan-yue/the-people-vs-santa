using UnityEngine;

public class CaseTwo : Game
{
    protected override void Enter()
    {
        PlayerPrefs.SetInt("Case Two", 1);
    }
}