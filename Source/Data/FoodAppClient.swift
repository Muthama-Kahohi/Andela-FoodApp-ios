//
//  FoodAppClient.swift
//  FoodApp-ios
//
//  Created by Martin Mungai on 28/03/2018.
//  Copyright © 2018 Paul Kahohi. All rights reserved.
//

import Firebase
import FirebaseAuth
import FirebaseDatabase

public class FoodAppClient {
    
    public init() {
        
    }
    
    // Database Instance
    static let databaseRef = Database.database().reference()
    
    
    
    //MARK: Public Instance Methods
    
    public func submitRatings(_ ratingValues: [Rating]) {
        
//        ratingValues[id] = Auth.auth().currentUser?.chef_id
    }
}
