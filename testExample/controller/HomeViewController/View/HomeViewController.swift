//
//  HomeViewController.swift
//  TestExample
//
//  Created by SatangBiiger Jaydeestan on 10/1/2564 BE.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: UIViewController {
    @IBOutlet weak var searchViewContainer: UIView!
    @IBOutlet weak var iconSearch: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var contentView: UIView!
    
    // MARK: - Properties
    
    var textForSearch: String?
    
    var launchpadList: [Launchpad] = []
    var launchpadListFilter = BehaviorRelay<[Launchpad]>(value: [])
    
    var disposeBag: DisposeBag = DisposeBag()
    
    lazy var viewModel: HomeViewModel = {
        let viewModel = HomeViewModel()
        viewModel.controller = self
        
        return viewModel
    }()
    
    lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    // MARK: - ViewControllerLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        
        viewModel.loadData {
            self.setupView()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupTableView()
    }
    
    // MARK: - Setup
    
    func setupNavigationBar() {
        title = "Test Rockets"
    }
    
    func setupView() {
        searchTextField.delegate = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pressBackground)))
        
        iconSearch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pressImageSearch)))
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "CellView_001", bundle: nil), forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc func pressBackground() {
        view.endEditing(true)
    }
    
    @objc func pressImageSearch() {
        view.endEditing(true)
    
    }

}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        textForSearch = textField.text == "" ? nil : textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        if textField.text == "" {
            textField.text = nil
        }
        
        return false
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchpadListFilter.value.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 111
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellView = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellView_001
        
        cellView.labelFirst.text = "Name: \(launchpadListFilter.value[indexPath.row].name ?? "-")"
        
        cellView.labelSecond.text = "Status: \(launchpadListFilter.value[indexPath.row].status ?? "-")"
        
        cellView.labelThird.text = ""
        
        return cellView
    }
    
    
}

