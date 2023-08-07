//
//  HistoryTransactionEntity.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 06/08/23.
//

import Foundation

class HistoryTransactionEntity : ObservableObject, TransactionHistoryBaseProtocol {
    func loadData() {
        do {
            let listTransactionString = preff.getDataString(key: "TRANSACTIONHISTORY")
            if !(listTransactionString ?? "").isEmpty {
                
                if let dataFromJsonString = listTransactionString?.data(using: .utf8) {
                    let ammountModel = try JSONDecoder().decode(TransactionModel.self,
                                                                from: dataFromJsonString)
                    self.listTransaction = (ammountModel.transactionHistory ?? [TransactionHistory]())
                }
                
            }
        } catch {
            //handle error
            print(error)
        }
    }
    
    let preff = SharedPrefference()
    @Published var listTransaction = [TransactionHistory]()
}
