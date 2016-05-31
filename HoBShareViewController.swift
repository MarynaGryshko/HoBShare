//
//  HoBShareViewController.swift
//  HoBShare
//
//  Created by Eric on 2016-05-12.
//  Copyright © 2016 Eric. All rights reserved.
//

import UIKit

import MapKit


class HoBShareViewController: UIViewController, CLLocationManagerDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{

    @IBOutlet weak var hobbiesCollectionView: UICollectionView!
    
    
    let availableHobbies: [String: [Hobby]] = HobbyDP().fetchHobbies()
    
    
    var myHobbies : [Hobby]?
    {
        didSet
        {
            self.hobbiesCollectionView.reloadData()
            
            saveHobbiesToUserDefault()
        }
    }
    
    
    let locationManager = CLLocationManager()
    
    
    var currentLocation : CLLocation?
    
    
    
    
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        locationManager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .NotDetermined
        {
            
            locationManager.requestAlwaysAuthorization()
        }
        else if CLLocationManager.authorizationStatus() == .AuthorizedAlways || CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse
        {
            
            locationManager.stopUpdatingLocation()
            
            locationManager.startUpdatingLocation()
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse{
        
            locationManager.stopUpdatingLocation()
            
            locationManager.startUpdatingLocation()
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        currentLocation = locations.last!
        
        manager.stopUpdatingLocation()
    }
    
    
    func locationManager(manager: CLLocationManager, didFinishDeferredUpdatesWithError error: NSError?)
    {
        print(error.debugDescription)
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print(error.debugDescription)
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
    
    func numberOfSectionInCollectionView(collectionView: UICollectionView) -> Int
    {
        if collectionView == hobbiesCollectionView
        {
            return 1
        }
        else
        {
            return availableHobbies.keys.count
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == hobbiesCollectionView
        {
            guard myHobbies != nil else
            {
                return 0
            }
            
            return myHobbies!.count
        }
        else
        {
            
            let key = Array(availableHobbies.keys)[section]
            
            return availableHobbies[key]!.count
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell: HobbyCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("HobbyCollectionViewCell", forIndexPath: indexPath) as! HobbyCollectionViewCell
        
        if collectionView == hobbiesCollectionView
        {
            
            let hobby = myHobbies![indexPath.item]
            
            cell.hobbyLabel.text = hobby.hobbyName
        }
        else
        {
            
            let key = Array(availableHobbies.keys)[indexPath.section]
            
            let hobbies = availableHobbies[key]
            
            let hobby = hobbies![indexPath.item]
            
            cell.hobbyLabel.text = hobby.hobbyName
        }
        
        cell.backgroundColor = UIColor.darkGrayColor()
        
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeOfItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        var availableWidth: CGFloat!
        
        let cellHight: CGFloat = 54
        
        var numberOfCells: Int!
        
        if collectionView == hobbiesCollectionView
        {
            
            numberOfCells = collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: indexPath.section)
            
            let padding = 10
            
            availableWidth = collectionView.frame.size.width - CGFloat( padding * (numberOfCells - 1))
        }
        else
        {
            numberOfCells = 2
            
            let padding = 10
            
            availableWidth = collectionView.frame.size.width - CGFloat( padding * (numberOfCells - 1))
        }
        
        let dynamicCellWidth = availableWidth / CGFloat(numberOfCells)
        
        let dynamicCellSize = CGSizeMake(dynamicCellWidth, cellHight)
        
        return dynamicCellSize
    }
    
    
    func showError(message: String)
    {
        let alert = UIAlertController(title: appTitle, message: message, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Dismiss", style: .Default){
            (action) in
            
            alert.dismissViewControllerAnimated(true, completion: nil)
            
        }
        
        alert.addAction(okAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    func saveHobbiesToUserDefault() -> ()
    {
        let hobbyData = NSKeyedArchiver.archivedDataWithRootObject(myHobbies!)
        
        NSUserDefaults.standardUserDefaults().setValue(hobbyData, forKey: "MyHobbies")
        
        NSUserDefaults.standardUserDefaults().synchronize()
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







