using Ink.Runtime;
using TMPro;
using UnityEngine;

public class ChoiceSelectPopupItem : PopupItem
{
    [SerializeField] private TMP_Text text;
    private ChoiceSelectPopup _popup;
    public Choice Choice { get; private set; }

    public void Init(ChoiceSelectPopup popup)
    {
        _popup = popup;
    }

    public void Show(Choice choice)
    {
        Choice = choice;
        text.SetText(choice.text);
    }

    public void OnClick()
    {
        _popup.Select(this);
    }
}
