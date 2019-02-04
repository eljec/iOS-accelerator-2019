//
//  MLBankMovements.swift
//  MLBankMovementsLib
//
//  Created by Marcio Mortarino on 31/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

import UIKit

@objc public class Team: NSObject, NSCoding {
    
    @objc public var value: Int
    @objc public var accountOwner: String
    @objc public var accountBalance: Int
    
    
    @objc public init(value: Int, accountOwner: String, accountBalance: Int) {
        self.value = value
        self.accountOwner = accountOwner
        self.accountBalance = accountBalance
        
    }
    
    @objc public required convenience init(coder aDecoder: NSCoder) {
        let value = aDecoder.decodeInteger(forKey: "value")
        let accountOwner = aDecoder.decodeObject(forKey: "accountOwner") as! String
        let accountBalance = aDecoder.decodeInteger(forKey: "accountBalance")
        self.init(value: value, accountOwner: accountOwner, accountBalance: accountBalance)
    }
    
    @objc public func encode(with aCoder: NSCoder) {
        aCoder.encode(value, forKey: "value")
        aCoder.encode(accountOwner, forKey: "accountOwner")
        aCoder.encode(accountBalance, forKey: "accountBalance")
    }
}

@objc public class MLBankMovements: NSObject {

    @objc public static func loadValues() -> Int {
        let userDefaults = UserDefaults.standard
        let teamsData  = userDefaults.object(forKey: "teams") as! Data
        var teams = NSKeyedUnarchiver.unarchiveObject(with: teamsData) as! [Team]
        return teams[teams.count - 1].accountBalance
    }
    
    @objc public func balanceCount() -> Int {
        var teams: [Team] = []
        let userDefaults = UserDefaults.standard
        let teamsData  = userDefaults.object(forKey: "teams") as! Data
        teams = NSKeyedUnarchiver.unarchiveObject(with: teamsData) as! [Team]
        return teams.count
    }
    
    @objc public func loadAccountOwnerFromArray() -> [Team] {
        var teams: [Team] = []
        let userDefaults = UserDefaults.standard
        let teamsData  = userDefaults.object(forKey: "teams") as! Data
        teams = NSKeyedUnarchiver.unarchiveObject(with: teamsData) as! [Team]
        return teams
    }
    
    @objc public static func save(value: Int, accountOwner: String) {
        let userDefaults = UserDefaults.standard
        let teamsData  = userDefaults.object(forKey: "teams") as? Data ?? nil
        var teams: [Team] = []

        if (teamsData == nil) {
            teams.append(Team(value: value, accountOwner: accountOwner, accountBalance: value))
        } else {
            let dataTeams = userDefaults.object(forKey: "teams") as! Data
            teams = NSKeyedUnarchiver.unarchiveObject(with: dataTeams) as! [Team]
            teams.append(Team(value: value, accountOwner: accountOwner, accountBalance: value + teams[teams.count - 1].accountBalance))
        }
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: teams)
        userDefaults.set(encodedData, forKey: "teams")
        userDefaults.synchronize()
    }
    
    @objc public static func delete() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "teams")
    }
}
