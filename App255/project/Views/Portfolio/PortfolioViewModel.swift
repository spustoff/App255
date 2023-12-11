//
//  PortfolioViewModel.swift
//  App255
//
//  Created by IGOR on 21/11/2023.
//

import SwiftUI

final class PortfolioViewModel: ObservableObject {

    @Published var balance: Int = 100000
    @AppStorage("currencies") var currencies: [String] = []
    @Published var currency_fc: [String] = ["EURUSD", "USDCHY", "EURCHY", "EURRUB", "USDRUB"]
    @Published var current_currency = ""
    @Published var isAddCurrency: Bool = false
}
