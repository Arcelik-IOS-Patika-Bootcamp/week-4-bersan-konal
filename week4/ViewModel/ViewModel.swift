//
//  ViewModel.swift
//  week4
//
//  Created by Muzaffer Berşan Konal on 15.06.2022.
//

import Foundation

protocol ViewModelDelegate {
    func didCoinDataFetch(_ data: [CoinTableViewCellViewModel])
}

class ViewModel {
    var service = Service()
    var viewModels = [CoinTableViewCellViewModel]()
    var delegate: ViewModelDelegate?
    //sending viewmodels with delegate
    public func didGetData() {
        service.getData(completion: { result  in
            switch result {
            case .success(let models):
                self.viewModels = models.compactMap({
                    CoinTableViewCellViewModel(name: $0.name ?? "-", price: "\(String($0.price_usd ?? 1))$")
                })
                
                self.delegate?.didCoinDataFetch(self.viewModels)
            case .failure(let error):
                print(error)
            }
        })
    
}

}
