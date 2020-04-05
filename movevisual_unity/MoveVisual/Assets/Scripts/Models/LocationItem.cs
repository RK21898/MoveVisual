using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LocationItem : MonoBehaviour
{
    public Vector3 coordinates;
    public DateTime dateTime;
    public Profile profile;

    public LocationItem(Vector3 coordinates, DateTime dateTime, Profile profile)
    {
        this.coordinates = coordinates;
        this.dateTime = dateTime;
        this.profile = profile;
    }
}
