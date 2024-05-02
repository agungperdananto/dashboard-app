//
//  Recent.swift
//  Dashboard App
//
//  Created by Agung  Perdananto on 01/05/24.
//

import SwiftUI

//Recent Transaction

struct Recent:Identifiable{
    
    var id = UUID().uuidString
    var title: String
    var price: String
    var image: String
}

var recents: [Recent] = [
    Recent(title: "Transfer via Card number", price: "$1200", image: "creditcard"),
    Recent (title: "Transfer Other Banks", price: "$120", image: "arrow.left.arrow.right"),
    Recent (title: "Transfer Same Bank", price: "$1500", image: "building.columns"),
    Recent (title: "Transfer via \n PayPal", price: "$800", image: "building.2.fill")
]
