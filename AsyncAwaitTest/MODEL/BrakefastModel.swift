//
//  BrakefastModel.swift
//  AsyncAwaitTest
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/01/2021.
//

import Foundation

struct BrakefastModel {
    let id: Int?
    let tost: Toast?
    let buns: Buns?
    let milk: Milk?
    let sigar: Sugar?
}

struct Toast {
    let id: Int?
    let tomato: Bool?
    let lettuce: Bool?
    let hum: Bool?
}

struct Buns {
    let id: Int?
    let chocolate: Bool?
    let cream: Bool?
}

struct Milk {
    let id: Int?
    let soja: Bool?
    let natural: Bool?
}

struct Sugar {
    let id: Int?
    let natural: Bool?
    let sweetener: Bool?
}


