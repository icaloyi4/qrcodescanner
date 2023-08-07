//
//  PembayaranRouter.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 06/08/23.
//

import Foundation
import SwiftUI

class PembayaranRouter{
    func navigateToPembayaran() -> some View {
        return PembayaranView(presenter: PembayaranPresenter())
    }
    
}
