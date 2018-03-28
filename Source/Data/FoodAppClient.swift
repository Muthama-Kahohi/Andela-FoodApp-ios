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
    
    let shared = FoodAppClient()
    
    // Database Instance
    static let databaseRef = FIRDatabase.database().reference()
    
    //MARK: Public Instance Methods
    public func submitRatings(_ ratingValues: [Rating]) {
        
//        ratingValues[Rating.id] = Auth.auth().currentUser?.chef_id
    }
}
