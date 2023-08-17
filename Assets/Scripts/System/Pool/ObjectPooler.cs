using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class ObjectPoolItem
{
    public GameObject objectToPool;
    public string poolName;
    public int amountToPool;
    public bool shouldExpand = true;
    public bool inEditor = true;
}

public class ObjectPooler : MonoBehaviour
{
    public const string DefaultRootObjectPoolName = "Pooled Objects";
    public static ObjectPooler Instance;
    public string rootPoolName = DefaultRootObjectPoolName;
    public List<PoolBehaviour> pooledObjects = new List<PoolBehaviour>();
    private List<ObjectPoolItem> itemsToPool;
    private PoolerScriptable PoolSettings;

    void OnEnable()
    {
        LoadFromScriptable();
        Instance = this;
    }

    private void LoadFromScriptable()
    {
        PoolSettings = Resources.Load("Scriptable/PoolSettings") as PoolerScriptable;
        itemsToPool = PoolSettings.itemsToPool;
    }

    private void Start()
    {
        foreach (var item in itemsToPool)
        {
            for (int i = 0; i < item.amountToPool; i++)
            {
                CreatePooledObject(item);
            }
        }
    }

    private GameObject GetParentPoolObject(string objectPoolName)
    {
        // Use the root object pool name if no name was specified
        // if (string.IsNullOrEmpty(objectPoolName))
        //     objectPoolName = rootPoolName;

        // if (GameObject.Find(rootPoolName) == null) new GameObject { name = rootPoolName };
        GameObject parentObject = GameObject.Find(objectPoolName);
        // Create the parent object if necessary
        if (parentObject == null)
        {
            parentObject = new GameObject();
            parentObject.name = objectPoolName;

            // Add sub pools to the root object pool if necessary
            if (objectPoolName != rootPoolName)
                parentObject.transform.parent = transform;
        }

        return parentObject;
    }

    private PoolBehaviour CreatePooledObject(ObjectPoolItem item)
    {
        // if (!Application.isPlaying && !item.inEditor)
        // {
        //     Debug.Log("not play not editor - " + item.objectToPool);
        //     return null;
        // }
        GameObject obj = Instantiate(item.objectToPool);
        // Get the parent for this pooled object and assign the new object to it
        var parentPoolObject = GetParentPoolObject(item.poolName);
        obj.transform.parent = parentPoolObject.transform;
        var poolBehaviour = obj.AddComponent<PoolBehaviour>();
        poolBehaviour.objName = item.objectToPool.name;
#if UNITY_EDITOR
        if (!Application.isPlaying)
        {
            // obj = PrefabUtility.ConnectGameObjectToPrefab(obj, item.objectToPool);
        }
#endif

        // obj.SetActive(false);
        pooledObjects.Add(poolBehaviour);


        return poolBehaviour;
    }
}
