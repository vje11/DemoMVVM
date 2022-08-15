//
//  LandingListVC+UItableViewExtension.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import UIKit

extension LandingListVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listingCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(with: TitleTableViewCell.self)
        cell.bind(with: viewModel.getData(at: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.navigate(to: .Detail(type: viewModel.selectedType(at: indexPath.row)))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
