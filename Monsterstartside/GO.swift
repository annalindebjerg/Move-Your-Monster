//
//  GO.swift
//  ZappLocationTracking
//
//  Created by Magnus Kinly on 17/04/15.
//  Copyright (c) 2015 Zappdesigntemplates.com. All rights reserved.
//

import Foundation
import UIKit

class videre: UIViewController {
    
    var highlighted: Bool = false
    var highlightedButton: UIButton!
    
    
    // TING FRA HJEM
    
    @IBOutlet weak var lblsaveStarPoints: UILabel!
    @IBOutlet weak var lblsundhedsPoint: UILabel!
    
    
    var defaults: NSUserDefaults!
    var userSettings: NSString!
    var starPoints: Int = 0
    var oldStarPoints: Int = 30
    var sundhedsPoint: NSString! = "50 / 100"
    
    
    // SLUT MED TING FRA HJEM
    
    
    // KNAPPER
    
    @IBOutlet var btnRun: UIButton!
    @IBOutlet var btnCycle: UIButton!
    @IBOutlet var btnWalk: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
     override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        highlightedButton = btnWalk
        highLightButton(btnWalk)
        
        // TING FRA HJEM
        
        defaults = NSUserDefaults.standardUserDefaults()
        if let user = defaults.stringForKey("currentUser"){
            //   userSettings = split(user) {$0 == ":"}
            
            if defaults.objectForKey("starPoints") != nil{
                starPoints = defaults.integerForKey("starPoints")
            }
            
            if defaults.objectForKey("newStarPoints") != nil{
                
            }
            
            // NSUserDefaults.standardUserDefaults().setObject(starPoints, forKey: "currentuser")
            // NSUserDefaults.standardUserDefaults().synchronize()
            
            
            
            
            
            lblsaveStarPoints.text = "\(starPoints + oldStarPoints)"
            
            
            lblsundhedsPoint.text = "\(sundhedsPoint)"
            
            
            
            
            
        }

        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "start" {
            var storyboard = segue.destinationViewController as! Aktiv
            storyboard.travelType = "\(travelType())"
            
        }
    }
    
    func travelType() -> Int{
        switch(highlightedButton){
        case btnRun:
            return 0
            break;
        case btnWalk:
            return 1
            break;
        case btnCycle:
            return 2
            break;
        default:
            return 2
            break
        }
    }
    
    @IBAction func cycling(sender: AnyObject) {
        var button = sender as! UIButton
        removeHighlightButton(highlightedButton)
        highLightButton(button)
        
    }
    
    func highLightButton (tmpbtn: UIButton){
        tmpbtn.layer.shadowColor = UIColor.whiteColor().CGColor
        tmpbtn.layer.shadowOffset = CGSizeZero
        tmpbtn.layer.shadowRadius = 10.0
        tmpbtn.layer.shadowOpacity = 1.0
        highlightedButton = tmpbtn
    }
    
    func removeHighlightButton(tmpbtn: UIButton){
        tmpbtn.layer.shadowColor = UIColor.clearColor().CGColor
    }

}
