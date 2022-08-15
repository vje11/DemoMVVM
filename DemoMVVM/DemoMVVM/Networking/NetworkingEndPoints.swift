

import Foundation
import Moya

// Final url to fetch the value 
/// https://api.github.com/repos/vje11/DemoMVVM/pulls?state=closed

enum Pullable {
    case closedPRList(page: Int)
}

extension Pullable: TargetType {
        
    var baseURL: URL {
        return URL(string: ApiConstant.baseUrl)!
    }
    
    var path: String {
        switch self {
          case .closedPRList: return "/pulls"
        }
    }

    var method: Moya.Method {
        switch self {
        case .closedPRList:
            return .get
        }
    }
    
    // 6:
    var parameters: [String: Any] {
        
        switch self {
          case .closedPRList(let page):
            return ["state": "closed", "page": page]
          default: return [:]
        }
    }
  
    // 7:
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
    // 8:
    var sampleData: Data {
        return Data()
    }
    
    // 9:
    var task: Task {
        return .requestParameters(parameters: self.parameters, encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        return ["Accept": "application/vnd.github+json",
                "Authorization": ApiConstant.token]
    }
    
}
