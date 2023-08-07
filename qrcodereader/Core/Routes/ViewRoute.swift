//
//  ViewRoute.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 05/08/23.
//

import Foundation

class ViewRouter:ObservableObject{
    @Published var currentRoute : Page = .homeScreen
}

enum Page {
    case homeScreen
    case qrScanner
    case transactionInformation
    case transactionHistory
}
