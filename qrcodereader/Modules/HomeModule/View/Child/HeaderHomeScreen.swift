//
//  HeaderHomeScreen.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 05/08/23.
//

import SwiftUI

struct HeaderHomeScreen: View {
    var username : String?
    var saldo : Int?
    var body: some View {
        VStack(alignment: .leading,spacing: 5){
            Text("Selamat Datang, "+(username ?? "")).font(.title)
            Text("Saldo Anda Saat Ini ")
            Text("Rp. \((saldo ?? 0))")
        }
        
    }
}

struct HeaderHomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HeaderHomeScreen()
    }
}

