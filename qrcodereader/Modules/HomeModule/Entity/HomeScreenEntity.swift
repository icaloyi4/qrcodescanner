//
//  HomeScreenEntity.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 05/08/23.
//

import Foundation

class HomeScreenEntity{
    @Published var saldoAwal = 0
    let preff = SharedPrefference()
    
    func loadSaldo(){
        do {
            let saldoAwal = preff.getDataString(key: "SALDOAWAL")
            if ( saldoAwal ?? "").isEmpty {
                
                self.saldoAwal = 1000000000
                let saldoModel = AmmountModel(userAmmount: self.saldoAwal)
                let encodedData = try JSONEncoder().encode(saldoModel)
                let jsonString : String? = String(data: encodedData,
                                        encoding: .utf8)
                preff.writeDataString(key: "SALDOAWAL", data: (jsonString ?? ""))
                
            } else {
                
                if let dataFromJsonString = saldoAwal?.data(using: .utf8) {
                    let ammountModel = try JSONDecoder().decode(AmmountModel.self,
                                                                from: dataFromJsonString)
                    self.saldoAwal = (ammountModel.userAmmount ?? 0)
                }
            }
        } catch {
            //handle error
            print(error)
        }
        
    }
    
}
