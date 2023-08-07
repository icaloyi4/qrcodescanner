//
//  Route.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 05/08/23.
//

import Foundation
import SwiftUI

enum Route{
    case homeScreen
    case pembayaran
    //    case transactionInformation
    case transactionHistory
}

class Navigation{
      static func navigateTo(route:Route)-> some View {
        
        if route == .homeScreen
        {
            return AnyView(HomeScreenView(presenter: HomeScreenPresenter()))
        }
        else if route ==  .pembayaran
        {
           
            return AnyView(PembayaranView(presenter: PembayaranPresenter()))
        }
        //        case .transactionInformation:
        //            <#code#>
        else if route ==  .transactionHistory
        {
            return AnyView(HistoryTransaction(presenter: HistoryTransactionPresenter()))
        } else {
            return AnyView(DefaultView())
        }
        
        
        
    }
}
