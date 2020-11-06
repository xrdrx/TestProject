//
//  DetailsViewController.swift
//  TestProject
//
//  Created by Aleksandr Svetilov on 05.11.2020.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let detailView: DetailView
    
    let viewModel: DetailViewModel
    
    init() {
        self.detailView = DetailView()
        self.viewModel = DetailViewModel()
        
        super.init(nibName: nil, bundle: nil)
        
        detailView.detailTableView.dataSource = self
        detailView.detailTableView.rowHeight = UITableView.automaticDimension

        detailView.detailTableView.register(DetailsViewCell.self, forCellReuseIdentifier: C.CellNames.detailCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }
}

//MARK: - Table view data source

extension DetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: C.CellNames.detailCell, for: indexPath) as! DetailsViewCell
        viewModel.configureCell(cell, forRowAt: indexPath)
        return cell
    }
}

//MARK: - Table view delegate

extension DetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! DetailsViewCell
        viewModel.configureCellShadow(cell)
    }
}
