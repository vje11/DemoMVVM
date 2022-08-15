//
//  landingRouter.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import UIKit


protocol Router {
    associatedtype Destination
    func navigate(to destination: Destination)
}

class LandingRouter: Router {

    enum Destination {
        case Detail(type: LandingListings)
    }
    
    private weak var navigationController: UINavigationController?
    
    // MARK: - Initializer
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    // MARK: - Router
    
    func navigate(to destination: Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Private
    
    private func makeViewController(for destination: Destination) -> BaseVC {
        
        switch destination {
            case .Detail(let type):
                let detailVC = DetailListingVC.instantiateFromStoryboard()
                detailVC.listingType = type
                return detailVC
        }
    }
}
