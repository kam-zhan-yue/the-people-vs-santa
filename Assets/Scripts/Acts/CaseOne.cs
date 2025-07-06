using UnityEngine;

public class CaseOne : Game
{
    protected override void Enter()
    {
        PlayerPrefs.SetInt("Case One", 1);
    }

    protected override void Exit()
    {
    }
}
