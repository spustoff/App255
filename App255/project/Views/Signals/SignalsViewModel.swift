//
//  SignalsViewModel.swift
//  App255
//
//  Created by IGOR on 22/11/2023.
//

import SwiftUI

final class SignalsViewModel: ObservableObject {

    @Published var signals: [String] = ["EURUSD", "USDEUR", "EURCHF", "USDCHF", "EURJPY", "USDJPY", "EURRUB", "USDRUB"]
    @Published var currentSignal = ""
    @Published var int = Double(.random(in: 1...2))
    
    @AppStorage("signals_saved") var signals_saved: [String] = []
    
    func favoritesManager(_ signal: String) {
        
        if signals_saved.contains(signal) {
            
            if let indexer = signals_saved.firstIndex(of: signal) {
                
                signals_saved.remove(at: indexer)
            }
            
        } else {
            
            signals_saved.append(signal)

        }
    }
    
    func isFavorited(_ signal: String) -> Bool {
        
        return signals_saved.contains(signal) ? true : false
    }
}
