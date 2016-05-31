//
//  Modles.swift
//  HoBShare
//
//  Created by Eric on 2016-05-12.
//  Copyright © 2016 Eric. All rights reserved.
//

import Foundation

class User: SFLBaseModel, JSONSerializable
{
    var userID: String?
    var username: String?
    var latitude: Double?
    var longtitude: Double?
    var hobbies = [Hobby]()
    var searchHobby : Hobby?
    
    
    
    override init()
    {
        super.init()
        
        self.delegate = self
    }
    
    
    init(username: String)
    {
        super.init()
        
        self.delegate = self
        
        self.username = username
    }
    
    
    override func getJSONDictionary() -> NSDictionary
    {
        let dict = super.getJSONDictionary()
        
        if self.userID != nil
        {
            dict.setValue(self.userID, forKey: "UserID")
        }
        
        if self.username != nil
        {
            dict.setValue(self.username, forKey: "Username")
        }
        
        if self.latitude != nil
        {
            dict.setValue(self.latitude, forKey: "Latitude")
        }
        
        if self.longtitude != nil
        {
            dict.setValue(self.longtitude, forKey: "Longtitude")
        }

        var jsonSafeHobbyArray = [String]()
        
        for hobby in self.hobbies
        {
            jsonSafeHobbyArray.append(hobby.hobbyName!)
        }
        
        dict.setValue(jsonSafeHobbyArray, forKey: "Hobbies")
        
        if self.searchHobby != nil
        {
            dict.setValue(self.searchHobby, forKey: "HobbySearch")
        }
        
        return dict
    }
    
    
    override func readFromJSONDictionary(dict: NSDictionary)
    {
        super.readFromJSONDictionary(dict)
        
        self.userID = dict["UserId"] as? String
        
        self.username = dict["Username"] as? String
        
        self.latitude = dict["Latitude"] as? Double
        
        self.longtitude = dict["Longtitude"] as? Double
        
        let returnHobbies = dict["Hobbies"] as? NSArray
        
        if let hobbies = returnHobbies
        {
            self.hobbies = Hobby.deserializeHobbies(hobbies)
        }
        
//        let searchHobbyName = dict["HobbySearch"] as? String
//        
//        self.searchHobby = Hobby(hobbyName: searchHobbyName!)
    }
}




class ListOfUsers: SFLBaseModel
{
    
}

class Hobby : SFLBaseModel, NSCoding
{
    var hobbyName : String?
    
    init(hobbyName: String)
    {
        super.init()
        
        self.delegate = self
        
        self.hobbyName = hobbyName
    }
    
    
    required init?(coder aDecoder: NSCoder)
    {
        self.hobbyName = aDecoder.decodeObjectForKey("HobbyName") as? String
    }
    
    
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(self.hobbyName, forKey: "HobbyName")
    }
    
    
    class func deserializeHobbies(hobbies: NSArray) -> [Hobby]
    {
        var returnArray = [Hobby]()
        
        for hobby in hobbies
        {
            if let hobbyName = hobby as? String
            {
                returnArray.append(Hobby(hobbyName: hobbyName))
            }
        }
        
        return returnArray
    }
}









