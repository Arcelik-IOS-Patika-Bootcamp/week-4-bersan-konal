//
//  Service.swift
//  week4
//
//  Created by Muzaffer Berşan Konal on 15.06.2022.
//

import Foundation

class Service {
    private struct Constants {
        static let url = "https://rest-sandbox.coinapi.io/v1/assets"
        static let apiKey = "32D5CA40-A6D7-4A90-B4D6-00252EFA990A"
    }
    
    //api call function
    func getData(completion: @escaping (Result<[CoinModel], Error>) -> Void) {
        guard let url = URL(string: Constants.url + "?apiKey=" + Constants.apiKey) else{return}
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data, error == nil else {return}
            
            do {
                let coins = try JSONDecoder().decode([CoinModel].self, from: data)
                completion(.success(coins))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
