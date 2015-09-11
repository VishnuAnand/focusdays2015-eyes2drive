//
//  SecondViewController.swift
//  eyes2drive viewer
//
//  Created by Lorenz Hänggi on 18/07/15.
//  Copyright (c) 2015 Focusdays2015. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    
    var delay: Bool = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "onLogEvent:",
            name: "EventLog",
            object: nil)
        
    }
    
    func onLogEvent(notification: NSNotification){
        var text = notification.object as! String
        addLogText(text)
    }

    @IBAction func fireEvent(sender: AnyObject) {
        var logText = ""
        switch sender.selectedSegmentIndex{
        case 0:
            logText = eyeHandler.addEvent(EventGreen(),delay: delay)
        case 1:
            logText = eyeHandler.addEvent(EventOrange(),delay: delay)
        case 2:
            logText = eyeHandler.addEvent(EventRed(),delay: delay)
        default:
            logText = eyeHandler.addEvent(EventGreen(),delay:delay)
        };
        NSLog(logText)
        addLogText(logText)
    }
    
    
    @IBOutlet weak var logUI: UITextView!

    func addLogText(text:String){
        if ((logUI) != nil) {
            logUI.text = text + "\n" + logUI.text
        }
    }
    
    
    @IBAction func fireStartStop(sender: AnyObject) {
        var logText = ""
        
        switch sender.selectedSegmentIndex{
        case 0:
            eyeHandler.startTrip()
            logText = "App started"
        case 1:
            eyeHandler.endTrip()
            logText = "App stopped"
        default:
            eyeHandler.startTrip()
            logText = "Error, default Case"
        };
        NSLog(logText); 
        addLogText(logText)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeDelay(sender: AnyObject) {
        var logText = ""
        if delaySwitch.on {
            delay = true
           logText = "Set Delay : true "
        } else {
            delay = false
            logText="Set Delay : false"
        }
        NSLog(logText)
        addLogText(logText)
    }
    
    @IBOutlet weak var delaySwitch: UISwitch!

}

