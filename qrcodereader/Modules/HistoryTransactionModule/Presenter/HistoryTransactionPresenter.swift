//
//  HistoryTransactionPresenter.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 06/08/23.
//

import Foundation
import Combine

class HistoryTransactionPresenter: ObservableObject, TransactionHistoryBaseProtocol {
     func loadData() {
         interactor.loadData()
    }
    
    
    private let interactor = HistoryTransactionInteractor()
    private var cancellables = Set<AnyCancellable>()
    @Published var listTransaction = [TransactionHistory]()
    
    init() {
        interactor.model.$listTransaction.assign(to: \.listTransaction, on: self)
            .store(in: &cancellables)
        loadData()
    }
}
