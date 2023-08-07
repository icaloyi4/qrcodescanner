//
//  qrcodereaderApp.swift
//  qrcodereader
//
//  Created by Rizky Haris Risaldi on 05/08/23.
//

import SwiftUI

@main
struct qrcodereaderApp: App {
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            HomeScreenView(presenter: HomeScreenPresenter())
        }
    }
}
