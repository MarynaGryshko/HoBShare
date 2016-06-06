//
//  EditHobbiesViewController.swift
//  HoBShare
//
//  Created by Eric on 2016-05-12.
//  Copyright © 2016 Eric. All rights reserved.
//

import UIKit

class EditHobbiesViewController: HoBShareViewController {

    @IBOutlet weak var availableHobbiesCollectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        availableHobbiesCollectionView.delegate = self
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
    {
        let reusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HobbiesCategoryHeader", forIndexPath: indexPath)
        
        
        (reusableView as! HobbiesCategoryHeader).categoryLabel.text = Array(availableHobbies.keys)[indexPath.section]
        
        return reusableView
    }
    
    
    func saveHobbies()
    {
        let requestUser = User()
        
        requestUser.userID = NSUserDefaults.standardUserDefaults().valueForKey("CurrentUserId") as? String
        
        if let myHobbies = self.myHobbies  // not nil
        {
            requestUser.hobbies = myHobbies
        }
    }
    

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        if collectionView == availableHobbiesCollectionView
        {
            let key = Array(availableHobbies.keys)[indexPath.section]
            
            let hobbies = availableHobbies[key]
            
            let hooby = hobbies![indexPath.item]
            
            if myHobbies?.contains( {$0.hobbyName == hooby.hobbyName} ) == false
            {
                if myHobbies?.count < kMaxHobbies
                {
                    myHobbies! += [hooby]
                    
                    self.saveHobbies()
                }
                else
                {
                    let alert = UIAlertController(title: "HoBshare", message: "You may only select up to\(kMaxHobbies) hobbies. Please delete a hobby, then try again", preferredStyle: .Alert)
                    
                    let okAction = UIAlertAction(title: "Dimiss", style: .Default, handler: nil)
                    
                    alert.addAction(okAction)
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
            
        }
        else
        {
            let alert = UIAlertController(title: "HoBshare", message: "Would you like to delete this hobby", preferredStyle: .Alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .Destructive){
                (action) in
                    self.myHobbies!.removeAtIndex(indexPath.item)
                    
                    self.saveHobbies()
            }
            
            
            let cannalAction = UIAlertAction(title: "Cancal", style: .Default){
                (action) in
                alert.dismissViewControllerAnimated(true, completion: nil)
            }
            
            alert.addAction(deleteAction)
            alert.addAction(cannalAction)
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
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
