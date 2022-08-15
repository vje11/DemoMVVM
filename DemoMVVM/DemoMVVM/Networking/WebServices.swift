


import Foundation
import Moya    

protocol PullRequestRepository: class {
    func getClosedPRList(endPoint: Pullable, result: @escaping (Result<[PRResponse],Error>)-> Void)
}

class QuotableService: PullRequestRepository {

    func getClosedPRList(endPoint: Pullable, result: @escaping (Result<[PRResponse],Error>)-> Void){
        
        NetworkAdapter.request(target: endPoint,
                               success: { (response) in
                                    do {
                                        let authorResponse = try response.map([PRResponse].self)
                                        result(.success(authorResponse))
                                    } catch {
                                        result(.failure(error))
                                    }

                                }) { (error) in
                                    result(.failure(error))
                                }
    }
}
