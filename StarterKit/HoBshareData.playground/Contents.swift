//: Playground - noun: a place where people can play

import UIKit

//////////////////////
// APPLICATION DATA //
//////////////////////

/* NOTE: THIS CODE WILL NOT COMPILE IN THIS PLAYGROUND. COPY AND PASTE THIS ENTIRE FUNCTION INTO YOUR HobbyDP.swift CLASS */

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

////////////////
// DUMMY DATA //
////////////////

// NOTE: THIS CODE WILL NOT COMPILE IN THE PLAYGROUND. IF NEEDED, COPY AND PASTE INTO YOUR IOS PROJECT TO TEST YOUR UI.
 



var gadgetsUsers = [User(userName: "Jane", hobbies: [Hobby(hobbyName:"Gadgets"), Hobby(hobbyName:"Tennis"), Hobby(hobbyName:"Video Games")], lat: 37.68604288, long: -122.41078686),
    User(userName: "Stephanie", hobbies: [Hobby(hobbyName:"Gadgets"), Hobby(hobbyName:"Surfing"), Hobby(hobbyName:"Video Games")], lat: 37.73821463, long: -122.47531166),
    User(userName: "Tiana", hobbies: [Hobby(hobbyName:"Gadgets"), Hobby(hobbyName:"Music"), Hobby(hobbyName:"Video Games")], lat: 37.71149346, long: -122.41715436)]

var appleUsers = [User(userName: "John", hobbies: [Hobby(hobbyName:"Apple"), Hobby(hobbyName:"Tennis"), Hobby(hobbyName:"Video Games")], lat: 37.79119233, long: -122.35587382),
    User(userName: "Steve", hobbies: [Hobby(hobbyName:"Apple"), Hobby(hobbyName:"Surfing"), Hobby(hobbyName:"Video Games")], lat: 37.74795136, long: -122.36311459),
    User(userName: "Tim", hobbies: [Hobby(hobbyName:"Apple"), Hobby(hobbyName:"Music"), Hobby(hobbyName:"Video Games")], lat: 37.73106912, long: -122.35687932)]

var productReviewUsers = [User(userName: "Kyle", hobbies: [Hobby(hobbyName:"Product Reviews"), Hobby(hobbyName:"Tennis"), Hobby(hobbyName:"Video Games")], lat: 37.77733089, long: -122.53727234),
    User(userName: "Rachel", hobbies: [Hobby(hobbyName:"Product Reviews"), Hobby(hobbyName:"Surfing"), Hobby(hobbyName:"Video Games")], lat: 37.86433702, long: -122.37899479),
    User(userName: "Kim", hobbies: [Hobby(hobbyName:"Product Reviews"), Hobby(hobbyName:"Music"), Hobby(hobbyName:"Video Games")], lat: 37.67816134, long: -122.43040752)]

var videoGameUsers = [User(userName: "John", hobbies: [Hobby(hobbyName:"Apple"), Hobby(hobbyName:"Tennis"), Hobby(hobbyName:"Video Games")], lat: 37.79119233, long: -122.35587382),
    User(userName: "Steve", hobbies: [Hobby(hobbyName:"Apple"), Hobby(hobbyName:"Surfing"), Hobby(hobbyName:"Video Games")], lat: 37.74795136, long: -122.36311459),
    User(userName: "Tim", hobbies: [Hobby(hobbyName:"Apple"), Hobby(hobbyName:"Music"), Hobby(hobbyName:"Video Games")], lat: 37.73106912, long: -122.35687932),
    User(userName: "Jane", hobbies: [Hobby(hobbyName:"Gadgets"), Hobby(hobbyName:"Tennis"), Hobby(hobbyName:"Video Games")], lat: 37.68604288, long: -122.41078686),
    User(userName: "Stephanie", hobbies: [Hobby(hobbyName:"Gadgets"), Hobby(hobbyName:"Surfing"), Hobby(hobbyName:"Video Games")], lat: 37.73821463, long: -122.47531166),
    User(userName: "Tiana", hobbies: [Hobby(hobbyName:"Gadgets"), Hobby(hobbyName:"Music"), Hobby(hobbyName:"Video Games")], lat: 37.71149346, long: -122.41715436),
    User(userName: "Kyle", hobbies: [Hobby(hobbyName:"Product Reviews"), Hobby(hobbyName:"Tennis"), Hobby(hobbyName:"Video Games")], lat: 37.77733089, long: -122.53727234),
    User(userName: "Rachel", hobbies: [Hobby(hobbyName:"Product Reviews"), Hobby(hobbyName:"Surfing"), Hobby(hobbyName:"Video Games")], lat: 37.86433702, long: -122.37899479),
    User(userName: "Kim", hobbies: [Hobby(hobbyName:"Product Reviews"), Hobby(hobbyName:"Music"), Hobby(hobbyName:"Video Games")], lat: 37.67816134, long: -122.43040752)]

/* IF NEEDED ADDITIONAL OR DIFFERENT LAT/LONG LOCATIONS CAN BE CREATED USING A RANDOMIZER SUCH AS CAN BE FOUND AT: http://www.geomidpoint.com/random/ THE FOLLOWING LIST WAS GENERATED USING SAN FRANCISCO AND A RADIUS OF 7 MILES:

Latitude: 37°47′28″N   37.79119233
Longitude: 122°21′21″W   -122.35587382
Distance: 3.6484 mi  Bearing: 72.037°

Latitude: 37°44′53″N   37.74795136
Longitude: 122°21′47″W   -122.36311459
Distance: 3.5973 mi  Bearing: 121.204°

Latitude: 37°43′52″N   37.73106912
Longitude: 122°21′25″W   -122.35687932
Distance: 4.5682 mi  Bearing: 131.556°

Latitude: 37°41′10″N   37.68604288
Longitude: 122°24′39″W   -122.41078686
Distance: 6.1616 mi  Bearing: 175.607°

Latitude: 37°44′18″N   37.73821463
Longitude: 122°28′31″W   -122.47531166
Distance: 3.971 mi  Bearing: 230.298°

Latitude: 37°42′41″N   37.71149346
Longitude: 122°25′02″W   -122.41715436
Distance: 4.3862 mi  Bearing: 178.385°

Latitude: 37°46′38″N   37.77733089
Longitude: 122°32′14″W   -122.53727234
Distance: 6.4407 mi  Bearing: 271.513°

Latitude: 37°51′52″N   37.86433702
Longitude: 122°22′44″W   -122.37899479
Distance: 6.5617 mi  Bearing: 19.641°

Latitude: 37°40′41″N   37.67816134
Longitude: 122°25′49″W   -122.43040752
Distance: 6.7152 mi  Bearing: 185.137°

*/