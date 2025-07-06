using Kuroneko.UIDelivery;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class TestimonyPopup : Popup
{
    [SerializeField] private TMP_Text testimonyText;
    [SerializeField] private Button backButton;
    private ActionPopup _actionPopup;
    private Game _game;

    public void Init(ActionPopup actionPopup, Game game)
    {
        _actionPopup = actionPopup;
        _game = game;
    }

    protected override void InitPopup()
    {
        backButton.onClick.AddListener(BackButtonClicked);
    }

    public override void ShowPopup()
    {
        base.ShowPopup();
        testimonyText.SetText(_game.database.TryGetTestimony(_game.TestimonyID, out Testimony testimony)
            ? testimony.testimony
            : string.Empty);
    }

    private void BackButtonClicked()
    {
        _actionPopup.ShowChoices();
    }
}
