//
//  Dashboard_AppApp.swift
//  Dashboard App
//
//  Created by Agung  Perdananto on 01/05/24.
//

import SwiftUI

@main
struct Dashboard_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

// Remove textfield ring

extension NSTextField{
    
    open override var focusRingType: NSFocusRingType{
        get{return .none}
        set{}
    }
}
