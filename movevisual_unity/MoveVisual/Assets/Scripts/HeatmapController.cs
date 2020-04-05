using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HeatmapController : MonoBehaviour
{
    private readonly DataController dataController = new DataController();

    public Dictionary<int, int> InspectData()
    {
        List<Inhabitant> inhabitants = dataController.ReadData();
        Dictionary<int, int> keyValuePairs = new Dictionary<int, int>();

        foreach (Inhabitant inhabitant in inhabitants)
        {
            if (!keyValuePairs.ContainsKey(inhabitant.RoomID)) { keyValuePairs.Add(inhabitant.RoomID, 1); }
            else { keyValuePairs[inhabitant.RoomID]++; }
        }

        foreach (KeyValuePair<int, int> kvp in keyValuePairs)
        {
            Debug.Log(kvp);
        }

        return keyValuePairs;
    }

    public void AttachRoomData()
    {
        GameObject[] rooms = GameObject.FindGameObjectsWithTag("Room");
        Dictionary<int, int> keyValuePairs = InspectData();
        
        foreach (GameObject room in rooms)
        {
            RoomItem roomInfo = room.GetComponent<RoomItem>();
            roomInfo.peopleCount = keyValuePairs[roomInfo.roomID];
        }
    }

    public void HeatMapColors()
    {
        GameObject[] rooms = GameObject.FindGameObjectsWithTag("Room");
        float totalInhabitants = 0; 

        foreach (GameObject room in rooms)
        {
            RoomItem roomInfo = room.GetComponent<RoomItem>();
            totalInhabitants += roomInfo.peopleCount;
        }
        
        foreach (GameObject room in rooms)
        {
            RoomItem roomInfo = room.GetComponent<RoomItem>();
            float t = roomInfo.peopleCount/totalInhabitants;
            Debug.Log(t);
            GameObject floor = GetFloor(room);
            Material mat = floor.GetComponent<Renderer>().material;
            mat.color = Color.Lerp(Color.blue, Color.yellow, t);
        }
    }

    private GameObject GetFloor(GameObject room)
    {
        for (int i = 0; i < room.transform.childCount; i++)
        {
            if (room.transform.GetChild(i).name == "BarFloor")
            {
                return room.transform.GetChild(i).gameObject;
            }
        }

        return null; 
    }


    // Start is called before the first frame update
    void Start()
    {
        AttachRoomData();
        HeatMapColors();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
