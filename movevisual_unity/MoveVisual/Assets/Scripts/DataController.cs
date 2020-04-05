using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

public class DataController : MonoBehaviour
{
    private readonly string FilePath = @"C:\Users\rowan\Desktop\MoveVisual\MoveVisual_ME_FIX\movevisual_unity\MoveVisualData.csv";
    private readonly string Delimiter = ";";
    [SerializeField]
    private readonly int DataLength = 5000;
    private readonly System.Random rand = new System.Random();

    public void WriteData()
    {
        if (!File.Exists(FilePath))
        {
            StringBuilder contents = new StringBuilder();

            for (int i = 0; i < DataLength; i++)
            {
                string RoomID = rand.Next(1, 9).ToString();
                string Date = new DateTime(2019, 12, rand.Next(1, 32)).ToString();
                contents.AppendLine(string.Join(Delimiter, RoomID, Date));
            }

            File.WriteAllText(FilePath, contents.ToString());
        }
    }

    public List<Inhabitant> ReadData()
    {
        string[] contents = File.ReadAllLines(FilePath);
        List<Inhabitant> inhabitants = new List<Inhabitant>();

        foreach (string s in contents)
        {
            string[] row = s.Split(';');

            int RoomID = Convert.ToInt32(row[0]);
            DateTime Date = Convert.ToDateTime(row[1]);

            inhabitants.Add(new Inhabitant(RoomID: RoomID, Date: Date));
        }

        return inhabitants;
    }

    void Start()
    {
        WriteData();
    }
}
