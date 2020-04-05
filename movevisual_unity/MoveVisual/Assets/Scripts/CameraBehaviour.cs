using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class CameraBehaviour : MonoBehaviour
{
    [SerializeField]
    GameObject Camera;

    [SerializeField]
    float speed = 5f;

    // Start is called before the first frame update
    void Start()
    {
        //Camera.transform.position = new Vector3(0, 0, 0);
    }

    void CameraMovement(string message)
    {
        string direction = message;
        Debug.Log(message);

        //if(message.)
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKey(KeyCode.RightArrow))
        {
            transform.Translate(new Vector3(speed * Time.deltaTime, 0, 0));
        }
        if (Input.GetKey(KeyCode.LeftArrow))
        {
            transform.Translate(new Vector3(-speed * Time.deltaTime, 0, 0));
        }
        if (Input.GetKey(KeyCode.DownArrow))
        {
            transform.Translate(new Vector3(0, -speed * Time.deltaTime, 0));
        }
        if (Input.GetKey(KeyCode.UpArrow))
        {
            transform.Translate(new Vector3(0, speed * Time.deltaTime, 0));
        }
    }
}
