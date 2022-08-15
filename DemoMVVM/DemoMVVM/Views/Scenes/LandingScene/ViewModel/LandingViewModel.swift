//
//  LandingViewModel.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import Foundation


class LandingViewModel{
    
    //MARK:- Observable Props
    var listingData = DWrapper<[LandingListViewModel]>([])
    
    //MARK:- Utility Methods
    func getListingData(){
        listingData.value = LandingListings.allCases.map({LandingListViewModel(value: $0)})
    }
    
    var listingCount: Int{
        return listingData.value.count
    }
    
    func getData(at index: Int)->LandingListViewModel{
        return listingData.value[index]
    }
    
    func selectedType(at index: Int)->LandingListings{
        return LandingListings.allCases[index]
    }
}



class LandingListViewModel{
    
    var option : String
    
    init(value: LandingListings) {
        option = value.value
    }
}
