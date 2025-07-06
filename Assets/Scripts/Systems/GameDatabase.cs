using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;

[CreateAssetMenu(menuName = "ScriptableObjects/Game Database", fileName = "Game Database")]
public class GameDatabase : ScriptableObject
{
    [Header("Evidence"), TableList] public List<Evidence> evidenceList;
    [Header("Testimony"), TableList] public List<Testimony> testimonyList;

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

    public bool TryGetTestimony(string id, out Testimony item)
    {
        foreach (Testimony testimony in testimonyList)
        {
            if (testimony.name == id)
            {
                item = testimony;
                return true;
            }
        }

        item = null;
        return false;
    }
}
