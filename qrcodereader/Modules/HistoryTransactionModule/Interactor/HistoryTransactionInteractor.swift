//
//  HistoryTransactionInteractor.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 06/08/23.
//

import Foundation

class HistoryTransactionInteractor : TransactionHistoryBaseProtocol{
    func loadData() {
        model.loadData()
    }
    
    let model : HistoryTransactionEntity = HistoryTransactionEntity()
}
