//
//  HomeViewModel.swift
//  testExample
//
//  Created by SatangBiiger Jaydeestan on 10/1/2564 BE.
//

import Foundation
import JSONParserSwift

class HomeViewModel {
    var controller: HomeViewController?
    
    func loadData(completion : @escaping () -> Void) {
        let url = URL(string: "https://api.spacexdata.com/v4/launchpads")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {(response, data, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
            
            self.controller?.launchpadList = self.parseJSON(data: data) ?? []
            self.controller?.launchpadListFilter.accept(self.parseJSON(data: data) ?? [])
            completion()

        }
    }
    
    // Function to parse JSON
    func parseJSON(data: Data) -> [Launchpad]? {
        
        var returnValue: [Launchpad]?
        do {
            returnValue = try JSONParserSwift.parse(string: String(data: data, encoding: .utf8)!)
            // Use base response object here
        } catch {
            print(error)
        }
        
        return returnValue
    }
}
