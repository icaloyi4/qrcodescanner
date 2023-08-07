//
//  HomeScreenView.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 05/08/23.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var presenter: HomeScreenPresenter
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                HeaderHomeScreen(username:"Rizky Haris Risaldi", saldo: presenter.saldoAwal).padding([.all], 20).frame(width: GetScreenSize.screenWidth,alignment: Alignment.leading)
                Divider()
                VStack{
                    Text("Menu").padding([.top,.bottom], 20)
                    HStack(alignment: .top){
                        Button(action: {},label:{NavigationLink {
                            Navigation.navigateTo(route: .pembayaran)
                        } label: {
                            CardButton(titleCard: "Transfer Dana", icon: "qrcode")
                        }})
                        Button(action: {},label:{NavigationLink {
                            Navigation.navigateTo(route: .transactionHistory)
                        } label: {
                            CardButton(titleCard: "History Transaksi", icon: "list.clipboard")
                        }})
                        
                    }
                }
                Spacer()
                
            }.padding(5).frame(width: GetScreenSize.screenWidth)
            
        }.onAppear(){
            print("home")
//            presenter.loadSaldo()
        }.navigationViewStyle(.stack)
    }
    
}

struct CardButton :View{
    var titleCard : String?
    var icon : String?
    var body: some View{
        
        VStack {
            Image(systemName: icon ?? "")
                .font(.title)
                .foregroundColor(.black).padding([.bottom], 5).padding(5)
            
            Text((titleCard ?? ""))
                .font(.caption)
                .foregroundColor(.gray).multilineTextAlignment(.center).padding(5)
        }.frame(width: 100, height: 100).overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 1)
        ).padding(10)
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeScreenView(presenter: HomeScreenPresenter())
        }
        
    }
}
