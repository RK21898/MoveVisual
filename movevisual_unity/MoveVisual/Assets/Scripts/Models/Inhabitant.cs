using System;
using System.Collections;
using System.Collections.Generic;

public class Inhabitant
{
    public int RoomID { get; set; }
    public DateTime Date { get; set; }
    
    public Inhabitant(int RoomID, DateTime Date)
    {
        this.RoomID = RoomID;
        this.Date = Date;
    }
}
