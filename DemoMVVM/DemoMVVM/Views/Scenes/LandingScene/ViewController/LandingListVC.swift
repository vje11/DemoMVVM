//
//  LandingListVC.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import UIKit

final class LandingListVC: BaseVC {

    //MARK:- IBOutlets/Properties
    @IBOutlet private weak var listingTableView: UITableView!
    var viewModel = LandingViewModel()
    lazy var router = LandingRouter(navigationController: self.navigationController)
            
    
    //MARK:- ViewLifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
    }
}




//MARK:- Initial Setup Methods

extension LandingListVC{
    
    func initialSetup(){
                
        title = AppConstants.landingTitle
        initTableView()
        handleCallBacks()
        router = LandingRouter(navigationController: self.navigationController)
    }
    
    func initTableView(){
            
        listingTableView.delegate = self
        listingTableView.dataSource = self
        listingTableView.registerCell(with: TitleTableViewCell.self)

        listingTableView.backgroundColor = AppColors.viewTransparentColor
    }
    
    func handleCallBacks(){
        
        viewModel.getListingData()
        
        viewModel.listingData.bindAndFire { [weak self](_) in
            guard let strongSelf = self else{return}
            strongSelf.listingTableView.reloadData()
        }
    }
}
