//
//  DataProviders.swift
//  HoBShare
//
//  Created by Eric on 2016-05-12.
//  Copyright © 2016 Eric. All rights reserved.
//

import Foundation

class UserDP: NSObject
{
    func getAccountForUser(user: User, completion: (User) -> ()) -> ()
    {
        let requestUrlString = serverPath + endpoint
        let HTTPMethod = "CREAATE_USER"
        let requestModel = user
        
        SFLConnection().ajax(requestUrlString, verb: HTTPMethod, requestBody: requestModel){
            (returnJSONDict) in
            
            let dict = NSDictionary(dictionary: returnJSONDict)
            
            let returnUser = User()
            
            returnUser.readFromJSONDictionary(dict)

            completion(returnUser)
        }
    }
}

class HobbyDP: NSObject {
    func fetchHobbies() -> [String : [Hobby]]
    {
        
        // We will provide this code
        
        return ["Technology" : [Hobby(hobbyName:"Video Games"),
            Hobby(hobbyName:"Computers"),
            Hobby(hobbyName:"IDEs"),
            Hobby(hobbyName:"Smartphones"),
            Hobby(hobbyName:"Programming"),
            Hobby(hobbyName:"Electronics"),
            Hobby(hobbyName:"Gadgets"),
            Hobby(hobbyName:"Product Reviews"),
            Hobby(hobbyName:"Computer Repair"),
            Hobby(hobbyName:"Software"),
            Hobby(hobbyName:"Hardware"),
            Hobby(hobbyName:"Apple"),
            Hobby(hobbyName:"Google"),
            Hobby(hobbyName:"Microsoft")]]
        
    }
    
    func saveHobbiesForUser(user: User, completion: (User)->())
    {
        let requestUrlString = serverPath + endpoint
        let HTTPMethod = "SAVE_HOBBIES"
        let requestModel = user
        
        SFLConnection().ajax(requestUrlString, verb: HTTPMethod, requestBody: requestModel){
            (retrunJSONDict) in
                let returnedUser = User()
                returnedUser.readFromJSONDictionary(retrunJSONDict)
                completion(returnedUser)
        }
    }
}












