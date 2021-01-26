//
//  ViewControllerInteractor.swift
//  AsyncAwaitTest
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/01/2021.
//

import Foundation

protocol ViewControllerInteractorProtocol {
    /*Problema 1: Pirámide de Doom
    func makeBrakefast(completionHandler: @escaping (BrakefastModel?) -> ())
    */
    
    /* Problema 2: Verbosidad y manejo de errores al estilo antiguo
    func makeBrakefast(completionHandler: @escaping (_ result: BrakefastModel?, _ error: NSError?) -> ())
    */
    
    func makeBrakefast(completionHandler: @escaping (_ result: BrakefastModel?) -> ())
    func makeBrakefastAsync(_ completionHandler: @escaping (_ result: BrakefastModel?) -> ())
}

class ViewControllerInteractorImplementation: ViewControllerInteractorProtocol {
    
    // Problema 1: Pirámide de Doom
    /*internal func makeBrakefast(completionHandler: @escaping (BrakefastModel?) -> ()) {
        self.withToast { toastResult in
            self.withBuns { bunsResult in
                self.withMilk { milkResult in
                    self.withSugar { sugarResult in
                        let BrakefastModel = BrakefastModel(id: 01, tost: toastResult, buns: bunsResult, milk: milkResult, sigar: sugarResult)
                        completionHandler(BrakefastModel)
                    }
                }
            }
        }
    }
    
    internal func withToast(completionHandler: @escaping(Toast?) -> ()) {
        let toats = Toast(id: 02, tomato: true, lettuce: true, hum: false)
        completionHandler(toats)
    }
    
    internal func withBuns(completionHandler: @escaping(Buns?) -> ()) {
        let buns = Buns(id: 03, chocolate: false, cream: true)
        completionHandler(buns)
    }
    
    internal func withMilk(completionHandler: @escaping(Milk?) -> ()) {
        let milk = Milk(id: 04, soja: true, natural: false)
        completionHandler(milk)
    }
    
    internal func withSugar(completionHandler: @escaping(Sugar?) -> ()) {
        let sugar = Sugar(id: 05, natural: true, sweetener: false)
        completionHandler(sugar)
    }*/
    
    // Problema 2: Verbosidad y manejo de errores al estilo antiguo
    /*internal func makeBrakefast(completionHandler: @escaping (_ result: BrakefastModel?, _ error: NSError?) -> ()) {
        self.withToast { toastResult, error in
            guard let toastResultDes = toastResult else {
                completionHandler(nil, error)
                return
            }
            self.withBuns { bunsResult, error in
                guard let bunsResultDes = bunsResult else {
                    completionHandler(nil, error)
                    return
                }
                self.withMilk { milkResult, error in
                    guard let milkResultDes = milkResult else {
                        completionHandler(nil, error)
                        return
                    }
                    self.withSugar { sugarResult, error in
                        guard let sugarResultDes = sugarResult else {
                            completionHandler(nil, error)
                            return
                        }
                        let BrakefastModel = BrakefastModel(id: 01, tost: toastResultDes, buns: bunsResultDes, milk: milkResultDes, sigar: sugarResultDes)
                        completionHandler(BrakefastModel, nil)
                    }
                }
            }
        }
    }
    
    internal func withToast(completionHandler: @escaping(_ result: Toast?, _ error: NSError?) -> ()) {
        let toats = Toast(id: 02, tomato: true, lettuce: true, hum: false)
        completionHandler(toats, nil)
    }
    
    internal func withBuns(completionHandler: @escaping(_ result: Buns?, _ error: NSError?) -> ()) {
        let buns = Buns(id: 03, chocolate: false, cream: true)
        completionHandler(buns, nil)
    }
    
    internal func withMilk(completionHandler: @escaping(_ result: Milk?, _ error: NSError?) -> ()) {
        let milk = Milk(id: 04, soja: true, natural: false)
        completionHandler(milk, nil)
    }
    
    internal func withSugar(completionHandler: @escaping(_ result: Sugar?, _ error: NSError?) -> ()) {
        let sugar = Sugar(id: 05, natural: true, sweetener: false)
        completionHandler(sugar, nil)
    }*/
    
    // Problemas de continuidad en el hilo principal (GCD + Thread's)
    /*internal func makeBrakefast(completionHandler: @escaping (_ result: BrakefastModel?, _ error: NSError?) -> ()) {
        self.withToast { toastResult, error in
            dispatch_async_and_wait(DispatchQueue.main) {
                guard let toastResultDes = toastResult else {
                    completionHandler(nil, error)
                    return
                }
                self.withBuns { bunsResult, error in
                    dispatch_async_and_wait(DispatchQueue.main) {
                        guard let bunsResultDes = bunsResult else {
                            completionHandler(nil, error)
                            return
                        }
                        self.withMilk { milkResult, error in
                            dispatch_async_and_wait(DispatchQueue.main) {
                                guard let milkResultDes = milkResult else {
                                    completionHandler(nil, error)
                                    return
                                }
                                self.withSugar { sugarResult, error in
                                    dispatch_async_and_wait(DispatchQueue.main) {
                                        guard let sugarResultDes = sugarResult else {
                                            completionHandler(nil, error)
                                            return
                                        }
                                        let BrakefastModel = BrakefastModel(id: 01, tost: toastResultDes, buns: bunsResultDes, milk: milkResultDes, sigar: sugarResultDes)
                                        completionHandler(BrakefastModel, nil)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    internal func withToast(completionHandler: @escaping(_ result: Toast?, _ error: NSError?) -> ()) {
        let toats = Toast(id: 02, tomato: true, lettuce: true, hum: false)
        completionHandler(toats, nil)
    }
    
    internal func withBuns(completionHandler: @escaping(_ result: Buns?, _ error: NSError?) -> ()) {
        let buns = Buns(id: 03, chocolate: false, cream: true)
        completionHandler(buns, nil)
    }
    
    internal func withMilk(completionHandler: @escaping(_ result: Milk?, _ error: NSError?) -> ()) {
        let milk = Milk(id: 04, soja: true, natural: false)
        completionHandler(milk, nil)
    }
    
    internal func withSugar(completionHandler: @escaping(_ result: Sugar?, _ error: NSError?) -> ()) {
        let sugar = Sugar(id: 05, natural: true, sweetener: false)
        completionHandler(sugar, nil)
    }*/
    
    // async / await
    // Antes
    internal func makeBrakefast(completionHandler: @escaping (_ result: BrakefastModel?) -> ()) {
        completionHandler(nil)
    }
    
    // Despues
    @asyncHandler internal func makeBrakefastAsync(_ completionHandler: @escaping (_ result: BrakefastModel?) -> ()){
        let toast = await self.withToast()
        let buns = await self.withBuns()
        let milk = await self.withMilk()
        let sugar = await self.withSugar()
        
        let brakefastModel = BrakefastModel(id: 01, tost: toast, buns: buns, milk: milk, sigar: sugar)
        completionHandler(brakefastModel)
    }
    
    internal func withToast() async -> Toast? {
        let toats = Toast(id: 02, tomato: true, lettuce: true, hum: false)
        return toats
    }
    
    internal func withBuns() async -> Buns? {
        let buns = Buns(id: 03, chocolate: false, cream: true)
        return buns
    }
    
    internal func withMilk() async -> Milk? {
        let milk = Milk(id: 04, soja: true, natural: false)
        return milk
    }
    
    internal func withSugar() async -> Sugar {
        let sugar = Sugar(id: 05, natural: true, sweetener: false)
        return sugar
    }
    
    
    
}
