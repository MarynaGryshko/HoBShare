//
//  MeViewController.swift
//  HoBShare
//
//  Created by Eric on 2016-05-12.
//  Copyright © 2016 Eric. All rights reserved.
//

import UIKit
import MapKit

class MeViewController: HoBShareViewController, UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var latitude: UILabel!
    
    @IBOutlet weak var longtitude: UILabel!
    
    
    @IBAction func submitButtonPressed(sender: AnyObject)
    {
        if validate() == true
        {
            submit()
        }
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.username.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        super.locationManager(manager, didUpdateLocations: locations)
    
        self.latitude.text = "Latitude: " + "\(currentLocation!.coordinate.latitude)"
        
        self.longtitude.text = "Longtitude: " + "\(currentLocation!.coordinate.longitude)"
    }
    
    
    func validate() -> Bool
    {
        if username.text != nil && username.text?.characters.count > 0
        {
            return true;
        }
        else
        {
            return false
        }
    }
    
    
    func submit() -> ()
    {
        username.resignFirstResponder()
        
        let requestUser = User(username: username.text!)
        
        requestUser.latitude = currentLocation?.coordinate.latitude
        
        requestUser.longtitude = currentLocation?.coordinate.longitude
        
        UserDP().getAccountForUser(requestUser){
            (retrunUser) in
            
            if retrunUser.status.code == 0
            {
                self.myHobbies = retrunUser.hobbies
            }
        }
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if validate() == true
        {
            submit()
        }
        else
        {
            showError("Did you enter a username?")
        }
    
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}







