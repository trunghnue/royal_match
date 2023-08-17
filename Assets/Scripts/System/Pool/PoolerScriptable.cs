using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// [CreateAssetMenu(fileName = "Pooler", menuName = "Sweet Sugar/Add pooler", order = 1)]
public class PoolerScriptable : ScriptableObject
{
    public List<ObjectPoolItem> itemsToPool;
}
