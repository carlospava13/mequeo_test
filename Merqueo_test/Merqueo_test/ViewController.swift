//
//  ViewController.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Combine
import MerqueoData
import UIKit
class ViewController: UIViewController {
    private var cancellable: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let apiClient = ApiClient()
        let repository = GetTokenRepository(service: apiClient)
        repository.request().sink { completion in
            switch completion {
            case .finished:
                print("Finished")
            case .failure(let error):
                print(error)
            }
        } receiveValue: { token in
            print(token)
        }.store(in: &cancellable)
    }
}
