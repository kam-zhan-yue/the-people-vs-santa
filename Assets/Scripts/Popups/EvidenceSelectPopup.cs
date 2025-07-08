using System.Collections.Generic;
using Cysharp.Threading.Tasks;
using Kuroneko.UIDelivery;
using Kuroneko.UtilityDelivery;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class EvidenceSelectPopup : Popup
{
    [SerializeField] private EvidenceSelectPopupItem[] popups;
    [SerializeField] private TMP_Text displayName;
    [SerializeField] private TMP_Text description;
    [SerializeField] private Button backButton;
    [SerializeField] private Button presentButton;
    private EvidenceSelectPopupItem _selected;
    private bool _interactable = false;
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
        presentButton.onClick.AddListener(PresentButtonClicked);
        for (int i = 0; i < popups.Length; ++i)
            popups[i].Init(this);
    }

    public void Show(bool interactable = false)
    {
        ShowPopup();
        _selected = null;
        _interactable = interactable;
        ShowItems();
        SelectFirstItem();
    }

    private void ShowItems()
    {
        for (int i = 0; i < popups.Length; ++i)
        {
            popups[i].SetEmpty();
        }
        List<Evidence> evidences = _game.GetEvidence();
        for (int i = 0; i < evidences.Count; ++i)
        {
            if (i < popups.Length)
            {
                popups[i].gameObject.SetActiveFast(true);
                popups[i].Show(evidences[i]);
            }
        }
    }

    private void SelectFirstItem()
    {
        if (popups.Length > 0)
            Select(popups[0]);
    }

    public void Select(EvidenceSelectPopupItem item)
    {
        if (_selected == item)
            return;

        // Deselect the previous if possible
        if (_selected)
            _selected.UnSelect();

        // Set the current selected
        _selected = item;
        _selected.Select();
        Evidence evidence = _selected.Evidence;
        if (evidence)
        {
            displayName.SetText(evidence.displayName);
            description.SetText(evidence.description);
            presentButton.gameObject.SetActiveFast(_interactable);
        }
        else
        {
            displayName.SetText(string.Empty);
            description.SetText(string.Empty);
            presentButton.gameObject.SetActiveFast(false);
        }
    }

    private void BackButtonClicked()
    {
        _actionPopup.EvidenceBackButtonClicked();
    }

    private void PresentButtonClicked()
    {
        _actionPopup.EvidenceSelected();
        _game.Choose(_selected.Evidence).Forget();
    }
}
