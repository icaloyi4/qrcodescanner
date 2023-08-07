//
//  PembayaranPresenter.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 06/08/23.
//

import Foundation
import Combine

class PembayaranPresenter : ObservableObject {
    private let interactor = PembayaranInteractor()
    private var cancellables = Set<AnyCancellable>()
    @Published  var isPresentingScanner :Bool = false
    @Published  var scannedCode: String?
    @Published var isQRValid:Bool = false
    
    init(){
        
        interactor.model.$isPresentingScanner.assign(to: \.isPresentingScanner, on: self)
            .store(in: &cancellables)
        interactor.model.$scannedCode.assign(to: \.scannedCode, on: self)
            .store(in: &cancellables)
    }
    
    func scanOpen(isOpen : Bool){
        interactor.model.isPresentingScanner = isOpen
    }
    
    func setScanCode(code : String) async -> Bool {
        var isValid = false
        DispatchQueue.main.async{
            self.interactor.model.scannedCode = code
            self.interactor.model.isPresentingScanner = false
        }
        
        
        if !code.isEmpty {
            DispatchQueue.main.async{
                self.interactor.model.scannedCode = "Tunggu sebentar, kami sedang memproses transaksimu"
            }
            
            let codeArray = code.components(separatedBy: ".")
            if !codeArray.isEmpty {
                if codeArray.count == 4 {
                    // Store Transaction
                  
                    let transactionHistory = TransactionHistory(id: codeArray[1], bank: codeArray[0], merchant: codeArray[2], value: Int(codeArray[3]))
                    await interactor.storeTransaction(transaction: transactionHistory)
                    isValid = true
                } else {
                    DispatchQueue.main.async{
                        self.interactor.model.scannedCode = "Code Tidak Valid"
                    }
                    
                }
            } else {
                DispatchQueue.main.async{
                    self.interactor.model.scannedCode = "Code Tidak Valid"
                }
                
            }
        }
        
        return isValid
    }
}
