using UnityEngine;

public class Popups : MonoBehaviour
{
    [SerializeField] private SpeakerPopup speakerPopup;
    [SerializeField] private DialoguePopup dialoguePopup;
    [SerializeField] private ActionPopup actionPopup;
    [SerializeField] private GameOverPopup gameOverPopup;

    public DialoguePopup DialoguePopup => dialoguePopup;
    public SpeakerPopup SpeakerPopup => speakerPopup;
    public ActionPopup ActionPopup => actionPopup;
    public GameOverPopup GameOverPopup => gameOverPopup;

    public void Init(Game game)
    {
        speakerPopup.Init(game);
        dialoguePopup.Init(game);
        actionPopup.Init(game);
        gameOverPopup.Init(game);
    }

    public void CheckEndGame()
    {
        speakerPopup.HidePopup();
        dialoguePopup.HidePopup();
        actionPopup.HidePopup();
        gameOverPopup.ShowPopup();
    }
}
