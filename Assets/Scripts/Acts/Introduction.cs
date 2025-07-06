using Kuroneko.AudioDelivery;
using Kuroneko.UtilityDelivery;
using UnityEngine;

public class Introduction : Game
{
    protected override void Enter()
    {
        PlayerPrefs.SetInt("Introduction", 1);
        ServiceLocator.Instance.Get<IAudioService>().Play("INTRODUCTION");
    }

    protected override void Exit()
    {
        ServiceLocator.Instance.Get<IAudioService>().Stop("INTRODUCTION");
    }
}
