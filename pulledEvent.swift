//
//  pulledEvent.swift
//  
//
//  Created by Sudikoff Lab iMac on 7/23/16.
//
//

import Foundation

class pulledNote {
    // All the attributes to the event post
    
    var title: String!
    var desc: String!
    var startTime: String!
    var endTime: String!
    var date: String!
    var location: String!
    var image: String!
    var idString: String!
    var tags: String!
    var ageRange: String!
    var latitude: String!
    var longitude: String!
    
    // Initializes all the event objects
    init(title: String, desc: String, startTime: String, endTime: String, date: String, location: String, image: String, tags: String, ageRange: String, latitude: String!, longitude: String!) {
        self.title = title
        self.desc = desc
        self.startTime = startTime
        self.endTime = endTime
        self.date = date
        self.location = location
        self.image = image
        self.idString = NSUUID().UUIDString
        self.tags = tags
        self.ageRange = ageRange
        self.latitude = latitude
        self.longitude = longitude
    }
    
    // Returns the idString of the chosen object
    func getIdString() -> String {
        return self.idString
    }
    
    // Returns the event object in the form of a dictionary
    func toArray() -> NSDictionary {
        let array = ["Title": title, "Description": desc, "Start Time": startTime, "End Time": endTime, "Date": date, "Location": location, "Image": image, "ID String": idString, "Tags": tags, "Age Range": ageRange, "Latitude": latitude, "Longitude": longitude]
        
        return array
    }
}