//
//  DetailListingViewModel.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import UIKit


class DetailListingViewModel{
    
    //MARK:- Observable Properties
    var closedPRList = DWrapper<[PullRequestViewModel]>([])
    var error =  DWrapper<String>("")
    var shouldShowLoader = DWrapper<Bool>(false)

    private var totalPages: Int = 0
    private var currentPage: Int = 0
    private var currentCount: Int = 0

    
    func allowPagination(with index: Int)-> Bool{
        return (currentPage < totalPages) && (index == currentCount - 1)
    }
    
    private var service : PullRequestRepository
    
    
    //required initilizer
    init(apiProtocol : PullRequestRepository) {
        service = apiProtocol
    }
    
    
    func getCloserPRList(showloader: Bool = false){
        
        shouldShowLoader.value = showloader
        
        service.getClosedPRList(endPoint: .closedPRList(page: currentPage + 1)) { [weak self] (result) in
            
            guard let strongSelf = self else { return }
            strongSelf.shouldShowLoader.value = false
            
            switch result {
                
            case .success(let response):
                strongSelf.closedPRList.value += response.map({PullRequestViewModel(listModel: $0)})
                
            case .failure(let error):
                strongSelf.error.value = error.localizedDescription
            }
        }
    }
}

extension DetailListingViewModel {
    
    var getClosedPRCount: Int {
        return closedPRList.value.count
    }

    func getClosedPR(at index: Int) -> PullRequestViewModel? {
        return closedPRList.value[index]
    }

}
