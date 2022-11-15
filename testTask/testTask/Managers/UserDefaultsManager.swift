//
//  UserDefaultsManager.swift
//  testTask
//
//  Created by Ihor on 12.11.2022.
//

import Foundation

class UserDefaultsManager {
    
    private enum ValueCases: String {
        case timerCompleted
    }
    
    func saveTimerCompleted(completed: Bool) {
        encodeData(value: completed, key: .timerCompleted)
    }
    
    func getTimerCompleted() -> Bool {
        return decodeData(key: .timerCompleted) ?? false
    }
    
    private func encodeData<T:Codable>(value: T, key: ValueCases) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: key.rawValue)
        }
    }
    
    private func decodeData<T:Codable>(key: ValueCases) -> T? {
        guard let savedPerson = UserDefaults.standard.object(forKey: key.rawValue) as? Data else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode(T.self, from: savedPerson)
    }
}
