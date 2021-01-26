//
//  ViewControllerPresenter.swift
//  AsyncAwaitTest
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/01/2021.
//

import Foundation

protocol ViewControllerPresenterProtocol {
    func fetchData()
}

class ViewControllerPresenterImplementation: ViewControllerPresenterProtocol {
   
    let view: ViewControllerProtocol = ViewController()
    let interactor: ViewControllerInteractorProtocol = ViewControllerInteractorImplementation()
    
    internal func fetchData() {
        /*Problema 1: Pirámide de Doom
        self.interactor.makeBrakefast{ myBrakefastModel in
           guard let myBrakefastModelDes = myBrakefastModel else { return }
           self.view.printData(data: myBrakefastModelDes)
        }*/
        
        /*Problema 2: Verbosidad y manejo de errores al estilo antiguo
        self.interactor.makeBrakefast { myBrakefastModel, error in
            if error == nil {
                guard let myBrakefastModelDes = myBrakefastModel else { return }
                self.view.printData(data: myBrakefastModelDes)
            }
        }*/
        
        //Async / await
        self.interactor.makeBrakefastAsync { myBrakefastModel in
            guard let myBrakefastModelDes = myBrakefastModel else { return }
            self.view.printData(data: myBrakefastModelDes)
        }
    }
}
