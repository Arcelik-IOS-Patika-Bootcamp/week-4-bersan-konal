//
//  ViewController.swift
//  week4
//
//  Created by Muzaffer Berşan Konal on 15.06.2022.
//

import UIKit

class ViewController: UIViewController {
    var viewModel = ViewModel()
    var coins: [CoinTableViewCellViewModel] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CoinTableViewCell", bundle: nil), forCellReuseIdentifier: "coinCell")
        // Do any additional setup after loading the view.
        viewModel.didGetData()
        viewModel.delegate = self
       
    }

//Because of my exams and senior project's presentation week, I don't have enough time make this homework more detailed. 
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell") as! CoinTableViewCell
        print(coins.count)
        cell.coinName.text = coins[indexPath.row].name
        cell.coinPrice.text = coins[indexPath.row].price
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
}
extension ViewController: ViewModelDelegate {
    func didCoinDataFetch(_ data: [CoinTableViewCellViewModel]) {
        self.coins = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
}
