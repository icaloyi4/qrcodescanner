//
//  HistoryTransaction.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 06/08/23.
//

import SwiftUI

struct HistoryTransaction: View {
    @ObservedObject var presenter: HistoryTransactionPresenter
    
    var body: some View {
        
        NavigationView{
            VStack{
                HeaderHistory().padding([.bottom], 10)
                Divider()
                VStack{
                    ScrollView{
                        ForEach(0..<presenter.listTransaction.count) { index in
                            HistoryItem(id: presenter.listTransaction[index].id , merchant: presenter.listTransaction[index].merchant, nominal: String(presenter.listTransaction[index].value ?? 0)).padding([.bottom],3)
                        }
                        
                        //                        HistoryItem().padding([.bottom],3)
                    }
                }
                
            }.padding([.all],10)
        }.navigationTitle("History Transaksi").navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden().navigationBarItems(leading: BackButton()).onAppear(){
            presenter.loadData()
        }
    }
}

struct HeaderHistory:View{
    var body:some View{
        HStack{
            Text("ID").frame(width: (GetScreenSize.screenWidth*0.2))
            Text("Merchant").frame(width: (GetScreenSize.screenWidth*0.3))
            Text("Nominal ").frame(width: (GetScreenSize.screenWidth*0.5))
            
        }
    }
}

struct HistoryItem:View{
    var id:String?
    var merchant:String?
    var nominal:String?
    var body:some View{
        HStack{
            Text((id ?? "-")).frame(width: (GetScreenSize.screenWidth*0.2))
            Text((merchant ?? "-")).frame(width: (GetScreenSize.screenWidth*0.3))
            Text((nominal ?? "-")).frame(width: (GetScreenSize.screenWidth*0.5))
            
        }
    }
}

struct HistoryTransaction_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HistoryTransaction(presenter: HistoryTransactionPresenter())
        }
        
    }
}
