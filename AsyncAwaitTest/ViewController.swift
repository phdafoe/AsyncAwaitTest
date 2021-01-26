//
//  ViewController.swift
//  AsyncAwaitTest
//
//  Created by Andres Felipe Ocampo Eljaiek on 21/01/2021.
//

import UIKit

protocol ViewControllerProtocol {
    func printData(data: BrakefastModel)
}

class ViewController: UIViewController {
    
    var presenter: ViewControllerPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = ViewControllerPresenterImplementation()
        self.presenter?.fetchData()
    }
    
}

extension ViewController: ViewControllerProtocol {
    func printData(data: BrakefastModel) {
        print("\(data.id ?? 0)")
    }
    
    
}

