//
//  FirebaseManager.swift
//  LoginScreenTutorial
//
//  Created by Maru on 07/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import FirebaseFirestore
import FirebaseStorage

class FirebaseManager {
    
    private let db = Firestore.firestore()
    private let storage = Storage.storage()
    
    private lazy var settings: FirestoreSettings = {
        let settings = FirestoreSettings()
        settings.areTimestampsInSnapshotsEnabled = true
        return settings
    }()
    
    init() {
        db.settings = settings
    }
}
