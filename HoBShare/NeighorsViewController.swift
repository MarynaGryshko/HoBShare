//
//  NeighorsViewController.swift
//  HoBShare
//
//  Created by Eric on 2016-05-12.
//  Copyright © 2016 Eric. All rights reserved.
//

import UIKit
import MapKit

class NeighorsViewController: HoBShareViewController, MKMapViewDelegate
{

    @IBOutlet weak var mapView: MKMapView!
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        mapView.delegate = self
        
    }
    
    override func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        currentLocation = locations.last!
        
        locationManager.stopUpdatingLocation()
        
        
    }
    
    func centerMapOnCurrentLocation() -> ()
    {
        guard currentLocation != nil else
        {
            print("Current location unavailable")
            return
        }
        
        mapView.setCenterCoordinate(currentLocation!.coordinate, animated: true)
        
        
        let currentRegion = mapView.regionThatFits(MKCoordinateRegionMake(CLLocationCoordinate2DMake(currentLocation!.coordinate.latitude, currentLocation!.coordinate.longitude), MKCoordinateSpanMake(0.5, 0.5)))
        
        mapView.setRegion(currentRegion, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        if let users = self.users
        {
            mapView.removeAnnotations(users)
        }
        
        self.fetchUsersWithHobby(myHobbies![indexPath.row])
        
        let cell = collectionView.dataSource?.collectionView(collectionView,cellForItemAtIndexPath:  indexPath) as! HobbyCollectionViewCell
        
        cell.backgroundColor = UIColor.redColor()
    }

    
    func fetchUsersWithHobby(hobby: Hobby)
    {
        guard (NSUserDefaults.standardUserDefaults().valueForKey("CurrentUserId") as? String)!.characters.count > 0 else
        {
            let alert = UIAlertController(title: "HoBshare", message: "Please login before selecting a hobby", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "Dismiss", style: .Default){
                (action) in
                    alert.dismissViewControllerAnimated(true, completion: nil)
            }
            
            alert.addAction(okAction)
            
            self.presentViewController(alert, animated: true, completion: nil)
            
            return
        }
        
        let requestUser = User()
        
        requestUser.userID = NSUserDefaults.standardUserDefaults().valueForKey("CurrentUserId") as? String
        
        requestUser.latitude = currentLocation?.coordinate.latitude
        requestUser.longtitude = currentLocation?.coordinate.longitude
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
