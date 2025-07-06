using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;

[CreateAssetMenu(menuName = "ScriptableObjects/Game Database", fileName = "Game Database")]
public class GameDatabase : ScriptableObject
{
    [Header("Evidence"), TableList] public List<Evidence> evidenceList;

    public bool TryGetEvidence(string id, out Evidence item)
    {
        foreach (Evidence evidence in evidenceList)
        {
            if (evidence.name == id)
            {
                item = evidence;
                return true;
            }
        }

        item = null;
        return false;
    }
}
