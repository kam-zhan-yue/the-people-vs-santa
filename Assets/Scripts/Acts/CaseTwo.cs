using Kuroneko.AudioDelivery;
using Kuroneko.UtilityDelivery;
using UnityEngine;

public class CaseTwo : Game
{
    protected override void Enter()
    {
        PlayerPrefs.SetInt("Case Two", 1);
    }

    protected override void Exit()
    {
        ServiceLocator.Instance.Get<IAudioService>().Stop("CASE_START");
        ServiceLocator.Instance.Get<IAudioService>().Stop("CASE_BREAK");
    }
}