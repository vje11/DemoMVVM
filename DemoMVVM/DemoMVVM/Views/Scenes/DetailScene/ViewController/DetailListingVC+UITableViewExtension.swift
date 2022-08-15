//
//  DetailListingVC+UITableViewExtension.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import UIKit

extension DetailListingVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch listingType {
            case .PullRequests: return viewModel.getClosedPRCount
            default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(with: DetailListingCell.self)
        switch listingType {
            
            case .PullRequests:
            let dataModel = viewModel.getClosedPR(at: indexPath.row)
            cell.updateCellData(with: dataModel)
            default: break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if viewModel.allowPagination(with: indexPath.row){
            tableView.showActivityForPagination(isHidden: false)
            initiateDataCall(showloader: false)
        } else {
            tableView.showActivityForPagination(isHidden: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
