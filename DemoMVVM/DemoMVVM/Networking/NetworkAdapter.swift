
import Foundation
import Moya


struct NetworkAdapter {
    
    static let provider = MoyaProvider<Pullable>()
    
    static func request(target: Pullable, success successCallback: @escaping (Response) -> Void, failure failureCallback: @escaping (MoyaError) -> Void) {
        
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    successCallback(response)
                } else {
                    let error = NSError(domain:"com.unknown.networkLayer", code: 0, userInfo:[NSLocalizedDescriptionKey: "Parsing Error"])
                    failureCallback(.underlying(error, nil))
                }
                
            case .failure(let error):
                failureCallback(error)
            }
        }
    }
}
