//
//  PembayaranInteractor.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 06/08/23.
//

import Foundation

class PembayaranInteractor {
    let model = PembayaranEntity()
    
    func storeTransaction(transaction :  TransactionHistory) async {
        await model.storeTransaction(transaction: transaction)
    }
}
