//
//  NetworkManager.swift
//  iOSApiRest
//
//  Created by Christian Rojas on 17/02/22.
//

import Foundation

public protocol URL_SessionDelegate {
    func connectionFinishSuccessfull(session: URL_Session, response: NSDictionary?) //Response del mismo tipo que devuelve el JSON o utilizar any para cachar cualquiera de los 2
    func connectionFinishWithError(session: URL_Session, error: Error)
}

public class URL_Session: NSObject, URLSessionDelegate, URLSessionDataDelegate {
    var dataTask: URLSessionDataTask? //Descarga los bytes, evalua la respuesta del servidor
    var responseData: Data = Data() //Respuesta del lado del servidor
    var httpResponse: HTTPURLResponse?
    public var delegate: URL_SessionDelegate?
    
    public override init() {
        super.init()
    }
    
    // MARK: - URLSession Delegate
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error == nil {
            if let resultado = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? NSDictionary {
                if resultado != nil {
                    delegate?.connectionFinishSuccessfull(session: self, response: resultado)
                } else {
                    print("Ocurrió un error con la serialización del JSON")
                }
            }
        } else {
            delegate?.connectionFinishWithError(session: self, error: error!)
        }
    }
    
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        responseData.append(data)
    }
    
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        
        httpResponse = response as? HTTPURLResponse
        
        if httpResponse?.statusCode == 200 {
            completionHandler(URLSession.ResponseDisposition.allow)
        } else {
            completionHandler(URLSession.ResponseDisposition.cancel)
        }
        
        //print("Estatus code server: \(httpResponse!.statusCode)")
    }
    
    // MARK: - Launch Requests
    public func getMovieFavorite(){
        if dataTask != nil {
            dataTask?.cancel()
        }
    
        let urlString = baseUrl + "3/account/11951775/favorite/movies?api_key=" + API_KEY +
            "&session_id=" + SESSION_ID +
            "&language=" + language +
            "&sort_by=created_at.asc" +
            "&page=1"
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)

        request.timeoutInterval = 15
        
        responseData = Data()

        dataTask = session.dataTask(with: request)
        dataTask?.resume()
    }
    
    public func getMovieRecommendations(){
        if dataTask != nil {
            dataTask?.cancel()
        }
    
        let urlString = baseUrl + "3/movie/262/recommendations?api_key=" + API_KEY +
            "&language=" + language
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)

        request.timeoutInterval = 15
        
        responseData = Data()

        dataTask = session.dataTask(with: request)
        dataTask?.resume()
    }
    
    public func getMovieRated(){
        if dataTask != nil {
            dataTask?.cancel()
        }
    
        let urlString = baseUrl + "3/account/11951775/rated/movies?api_key=" + API_KEY +
            "&language=" + language +
            "&session_id=" + SESSION_ID +
            "&sort_by=created_at.asc" +
            "&page=1"
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)

        request.timeoutInterval = 15
        
        responseData = Data()

        dataTask = session.dataTask(with: request)
        dataTask?.resume()
    }
    
    public func getTvShowFavorite(){
        if dataTask != nil {
            dataTask?.cancel()
        }
  
        let urlString = baseUrl + "3/account/11951775/favorite/tv?api_key=" + API_KEY +
            "&language=" + language +
            "&session_id=" + SESSION_ID +
            "&sort_by=created_at.asc" +
            "&page=1"
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)

        request.timeoutInterval = 15
        
        responseData = Data()

        dataTask = session.dataTask(with: request)
        dataTask?.resume()
    }
    
    public func getTvShowRecommendations(){
        if dataTask != nil {
            dataTask?.cancel()
        }
    
        let urlString = baseUrl + "/3/tv/100/recommendations?api_key=" + API_KEY + "&language=" + language
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)

        request.timeoutInterval = 15
        
        responseData = Data()

        dataTask = session.dataTask(with: request)
        dataTask?.resume()
    }
    
    public func getTvShowRated(){
        if dataTask != nil {
            dataTask?.cancel()
        }
    
        let urlString = baseUrl + "3/account/11951775/rated/tv?api_key=" + API_KEY +
            "&language=" + language +
            "&session_id=" + SESSION_ID +
            "&sort_by=created_at.asc" +
            "&page=1"
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)

        request.timeoutInterval = 15
        
        responseData = Data()

        dataTask = session.dataTask(with: request)
        dataTask?.resume()
    }
    
    
}

