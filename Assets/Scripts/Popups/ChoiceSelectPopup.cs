using System.Collections.Generic;
using Cysharp.Threading.Tasks;
using Ink.Runtime;
using Kuroneko.UIDelivery;
using Kuroneko.UtilityDelivery;
using UnityEngine;

public class ChoiceSelectPopup : Popup
{
    [SerializeField] private ChoiceSelectPopupItem samplePopupItem;
    [SerializeField] private RectTransform choiceHolder;

    private List<ChoiceSelectPopupItem> _popupItems = new();
    
    private ActionPopup _actionPopup;
    private Game _game;
    
    
    public void Init(ActionPopup actionPopup, Game game)
    {
        _actionPopup = actionPopup;
        _game = game;
    }
    
    protected override void InitPopup()
    {
    }

    public override void ShowPopup()
    {
        base.ShowPopup();
        InstantiateItems(); 
        ShowItems();
    }

    private void InstantiateItems()
    {
        List<Choice> choices = _game.GetChoices();
        int numToSpawn = choices.Count - _popupItems.Count;
        if (numToSpawn > 0)
        {
            samplePopupItem.gameObject.SetActiveFast(true);
            for (int i = 0; i < numToSpawn; ++i)
            {
                ChoiceSelectPopupItem item = Instantiate(samplePopupItem, choiceHolder);
                item.Init(this);
                _popupItems.Add(item);
            }
        }

        for (int i = 0; i < _popupItems.Count; ++i)
            _popupItems[i].gameObject.SetActiveFast(false);
        
        samplePopupItem.gameObject.SetActiveFast(false);
    }

    private void ShowItems()
    {
        List<Choice> choices = _game.GetChoices();
        for (int i = 0; i < choices.Count; ++i)
        {
            if (i < _popupItems.Count)
            {
                _popupItems[i].gameObject.SetActiveFast(true);
                _popupItems[i].Show(choices[i]);
            }
        }
    }

    public void Select(ChoiceSelectPopupItem item)
    {
        _actionPopup.ChoiceSelected();
        _game.Choose(item.Choice).Forget();
    }
}
