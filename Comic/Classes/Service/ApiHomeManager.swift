//
//  ApiHomeManager.swift
//  Comic
//
//  Created by HoaPQ on 7/7/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias CompletionDict = (Bool, [String: Any?]?)->()

class ApiHomeManager
{
    static let shared: ApiHomeManager = ApiHomeManager()
    
    func getHomeComics(completion: @escaping CompletionDict)
    {
        let request = NSMutableURLRequest(url: NSURL(string: "https://mbcomic-app.herokuapp.com/comics/home")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let responseHTTP = response as? HTTPURLResponse {
                if responseHTTP.statusCode == 200 || responseHTTP.statusCode == 201 {
                    if (error != nil) {
                        completion(false , nil)
                    } else {
                        guard let data = data else {
                            completion(false, nil)
                            return
                        }
                        let json = JSON(data)
                        var newest = [ComicHomeModel]()
                        for newestJson in json["newest"].arrayValue
                        {
                            let comic = ComicHomeModel(json: newestJson)
                            newest.append(comic)
                        }
                        
                        var popular = [ComicHomeModel]()
                        for popularJson in json["popular"].arrayValue {
                            let comic = ComicHomeModel(json: popularJson)
                            popular.append(comic)
                        }
                        
                        completion(true, ["newest": newest, "popular": popular])
                    }
                }
                else
                {
                    completion(false , nil)
                }
            }
        })
        dataTask.resume()
    }
    func getDetail(completion: @escaping CompletionDict)
    {
        let request = NSMutableURLRequest(url: NSURL(string: "https://mbcomic-app.herokuapp.com/comics?id=530")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, request, error) -> Void in
            if let responseHTTP = request as? HTTPURLResponse
            {
                if responseHTTP.statusCode == 200 || responseHTTP.statusCode == 201
                {
                    if (error != nil) {
                        completion(false , nil)
                    } else {
                        guard let data = data else {
                            completion(false, nil)
                            return
                        }
                        let json = JSON(data)
                        var detail = DetailComicModel(json: json)
                        
                        completion(true, ["data": detail])
                }
                }
                    else
                    {
                        completion(false , nil)
                    }
            }
        }
        dataTask.resume()
    }
    
}
