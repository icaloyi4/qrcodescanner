//
//  PembayaranView.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 06/08/23.
//

import SwiftUI
import CodeScanner

struct PembayaranView: View {
    //    @ObservedObject var m = PembayaranEntity()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var presenter: PembayaranPresenter
    @State var isQRHaveData = false
    init(presenter: PembayaranPresenter) {
        self.presenter = presenter
    }
    var body: some View {
        //        presenter = PembayaranPresenter(model: m)
        NavigationView{
            VStack{
                Text("QR Scanner").font(.title).padding([.bottom], 10)
                if presenter.isPresentingScanner {
                    NavigationLink(destination: Navigation.navigateTo(route: .transactionHistory),  isActive: $isQRHaveData){
                        CodeScannerView(codeTypes: [.qr], simulatedData: "BNI.ID12345678.MERCHANT MOCK TEST.50000") { response in
                            Task{
                                if case let .success(result) = response {
                                    presenter.scanOpen(isOpen: false)
                                    let isValid = await presenter.setScanCode(code : result.string)
                                    presenter.scanOpen(isOpen: true)
                                    isQRHaveData = isValid
//                                    self.presentationMode.wrappedValue.dismiss()
    //                                self.$isQRHaveData.update()
                                    
                                } else {
                                    _ = await presenter.setScanCode(code : "")
                                    presenter.scanOpen(isOpen: true)
                                }
                            }
                            
                        }.frame(height: GetScreenSize.screenHeight*0.4).navigationBarBackButtonHidden()
                    }
                    
                } else {
                    ProgressView().frame(height: GetScreenSize.screenHeight*0.4)
                }
                Text(presenter.scannedCode ?? "Arahkan kamera ke Kode QR").font(.body).padding([.bottom], 10)
                
            }.onAppear{
                presenter.scanOpen(isOpen: true)
            }.navigationViewStyle(.stack)
        }
    }
}

struct PembayaranView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
            PembayaranView(presenter: PembayaranPresenter())
        }
        
    }
}
