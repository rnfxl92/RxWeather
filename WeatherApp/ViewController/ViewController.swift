//
//  ViewController.swift
//  WeatherApp
//
//  Created by 박성민 on 2021/01/29.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, ViewModelBindableType {
    var viewModel: MainViewModel!
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var listTableView: UITableView!
    
    func bindViewModel() {
        viewModel.title
            .bind(to: locationLabel.rx.text)
            .disposed(by: rx.disposeBag)
        
        viewModel.weatherData
            .drive(listTableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: rx.disposeBag)
        
        viewModel.weatherData.asObservable()
            .subscribe(onNext: { [unowned self] _ in
                self.listTableView.alpha = 1.0
                self.loader.alpha = 0.0
            })
            .dispose()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.alpha = 1.0
        listTableView.alpha = 0.0
        
        listTableView.backgroundColor = UIColor.clear
        listTableView.separatorStyle = .none
        listTableView.showsVerticalScrollIndicator = false
        listTableView.allowsSelection = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    var topInset: CGFloat = 0.0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if topInset == 0.0 {
            let first = IndexPath(row: 0, section: 0)
            if let cell = listTableView.cellForRow(at: first) {
                topInset = listTableView.frame.height - cell.frame.height
                listTableView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
            }
        }
    }
    
}
