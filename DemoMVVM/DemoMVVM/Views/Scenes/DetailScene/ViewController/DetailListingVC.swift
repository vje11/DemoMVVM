//
//  DetailListingVC.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import UIKit

final class DetailListingVC: BaseVC {

    //MARK:- IBOutlets/Properties
    @IBOutlet private weak var listingTableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: DetailListingViewModel!
    var listingType: LandingListings = .PullRequests

    //MARK:- ViewLifeCycleMethods

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
    }
}



//MARK:- Initial Setup

extension DetailListingVC {
    
  private func initialSetup() {
        
        title = listingType.value
    
        viewModel = DetailListingViewModel(apiProtocol: QuotableService())
        
        listingTableView.delegate = self
        listingTableView.dataSource = self
    
        listingTableView.backgroundColor = AppColors.viewTransparentColor
    
        listingTableView.registerCell(with: DetailListingCell.self)
    
        handleCallbacks()
        initiateDataCall()
    }
    
    
   private func handleCallbacks() {
        
        viewModel.closedPRList.bindAndFire({ [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.listingTableView.reloadData()
        })
        
        viewModel.shouldShowLoader.bindAndFire({ [weak self] (value) in
            guard let strongSelf = self else { return }
            strongSelf.view.isUserInteractionEnabled = !value
            if value {
                ProgressHUD.show()
            } else {
                ProgressHUD.dismiss()
            }
        })
        
        viewModel.error.bindAndFire({ (value) in
            print(value)
        })
    }
    
    
    func initiateDataCall(showloader: Bool = true) {
        
        switch listingType {
            case .PullRequests:
            viewModel.getCloserPRList(showloader: showloader)

            default: break
        }
    }
}
