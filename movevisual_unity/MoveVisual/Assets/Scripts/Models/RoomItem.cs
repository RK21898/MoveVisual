using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RoomItem : MonoBehaviour
{
    [SerializeField]
    public int roomID;
    [SerializeField]
    public int peopleCount;

    public RoomItem(int roomID, int peopleCount)
    {
        this.roomID = roomID;
        this.peopleCount = peopleCount;
    }
}
