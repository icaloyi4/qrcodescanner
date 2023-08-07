//
//  HomeScreenPresenter.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 05/08/23.
//

import Foundation
import SwiftUI
import Combine

class HomeScreenPresenter : ObservableObject {
    
    private let interactor = HomeScreenInteractor()
    private var cancellables = Set<AnyCancellable>()
    @Published var saldoAwal = 1000000000
    
    init(){
        
        interactor.model.$saldoAwal.assign(to: \.saldoAwal, on: self)
            .store(in: &cancellables)
        loadSaldo()
    }
    
    func loadSaldo(){
        interactor.loadSaldo()
    }
}
