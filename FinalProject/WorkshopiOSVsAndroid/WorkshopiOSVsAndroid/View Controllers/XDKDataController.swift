//
//  XDKDataController.swift
//  WorkshopiOSVsAndroid
//
//  Created by Daniel Reyes Sánchez on 25/03/18.
//  Copyright © 2018 Daniel Reyes Sánchez. All rights reserved.
//

import UIKit

class XDKDataViewController:UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    lazy var tableView:UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        return tv
    }()
    
    
    var cells = [CardRepresentable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupData()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.register(UINib(nibName: MeasureCell.nibName, bundle: nil), forCellReuseIdentifier: MeasureCell.cellId)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Measures"
    }
    
    private func setupData() {
        ApiService.sharedInstance.getXDKData({ (measures) in
            for measure in measures {
                self.cells.append( MeasureViewModel(measure: measure) )
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cells[indexPath.row].rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row].cellInstance(tableView, indexPath)
    }
    
    
}
