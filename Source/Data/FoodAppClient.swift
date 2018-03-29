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
    
    //Private Instance Methods
    
    private var appDelegate: AppDelegate? {
        guard
            let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate
    }
    
    private var currentUser: User? {
        return appDelegate?.currentUser
    }
    
    private var currentUserID: String? {
        return appDelegate?.currentUserId
    }
    
    // Database Instance
    static let databaseRef = Database.database().reference()
    
    //MARK: Public Instance Methods
    
    public func getChildrenCount(completion: @escaping (UInt) -> Void) {
        
        FoodAppClient.databaseRef.child("ratings").observe(.value, with: { (snapshot) in
            
            completion(snapshot.childrenCount)
        })
    }
    
    public func submitRatings(_ ratingValues: [Ratings]) {
        
        for rating in ratingValues {
            
            var count: UInt?
            
            getChildrenCount(completion: { (childrenCount) in
                count = childrenCount + 1
            })
            
            FoodAppClient.databaseRef.child("ratings/\(count!)").setValue(["chef_id": 1,
                                                                           "comment": rating.comment,
                                                                           "date": rating.date,
                                                                           "meal_id": rating.mealId,
                                                                           "values": rating.values])
        }
    }
}
