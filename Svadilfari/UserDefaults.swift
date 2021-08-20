//
//  UserDefaults.swift
//  UserDefaults
//
//  Created by Shun Kashiwa on 2021/08/04.
//

import Foundation

extension UserDefaults {
    /// shared instance that can be accessed from all targets
    static var shared: Self {
        return Self(suiteName: APP_GROUP_ID)!
    }

    private enum Keys {
        static let previouslyLaunched = "previouslyLaunched"
    }

    var isFirstLaunch: Bool {
        // to get `true` on the first launch, get/set inverted values
        get {
            return !self.bool(forKey: Keys.previouslyLaunched)
        }
        set {
            self.setValue(!newValue, forKey: Keys.previouslyLaunched)
        }
    }
}
