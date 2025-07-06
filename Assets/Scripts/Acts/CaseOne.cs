using Kuroneko.AudioDelivery;
using Kuroneko.UtilityDelivery;
using UnityEngine;

public class CaseOne : Game
{
    protected override void Enter()
    {
        PlayerPrefs.SetInt("Case One", 1);
    }

    protected override void Exit()
    {
        ServiceLocator.Instance.Get<IAudioService>().Stop("CASE_START");
        ServiceLocator.Instance.Get<IAudioService>().Stop("CASE_BREAK");
    }
}
