//
//  USERDEFMANAGER.swift
//  DZ SPISOK - IMENA
//
//  Created by BK on 13.03.2024.
//

import Foundation


class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    func saveName(_ name: String) {

        if var names = UserDefaults.standard.array(forKey: "Names") as? [String] {
            names.append(name)
            UserDefaults.standard.setValue(names, forKey: "Names")
        } else {
            UserDefaults.standard.set([name], forKey: "Names")
        }
    }
    
    func getNames() -> [String] {
        let names = UserDefaults.standard.array(forKey: "Names") as? [String] ?? []
        print(names)
        return names
    }
}
