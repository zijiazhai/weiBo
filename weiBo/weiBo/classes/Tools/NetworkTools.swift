//
//  NetworkTools.swift
//  封装_AFN
//
//  Created by zijia on 2016/11/29.
//  Copyright © 2016年 zijia. All rights reserved.
//

import AFNetworking

// 定义枚举类型
enum RequestType : String{
    case GET = "GET"
    case POST = "POST"
}

class NetworkTools: AFHTTPSessionManager {
 
    
    // = 右边是闭包给shareInstance赋值， 最后边的（）里边为参数为nil，代表执行闭包
    static let shareInstance : NetworkTools = {
       
        let tool = NetworkTools()
        //接受"text/html"这种格式 from server
        tool.responseSerializer.acceptableContentTypes?.insert("text/html")
        tool.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tool
        
    }()
}


// MARK:- request method 封装请求方法
extension NetworkTools{
    func request(methodType : RequestType, urlString: String, parameter : [String : AnyObject], finished : @escaping (_ result : AnyObject?, _ error : NSError?) -> ()){
        
        if methodType == .GET{
            
                get(urlString, parameters: parameter, progress: nil, success: { (task : URLSessionDataTask, result : Any?) in finished(result as AnyObject?, nil)
            }) { (task : URLSessionDataTask?, error : Error) in finished(nil, error as NSError?)
            }
        }
        else{
            post(urlString, parameters: parameter, progress: nil
                , success: { (task :URLSessionDataTask, result : Any?) in
                finished(result as AnyObject?, nil)
            }) { (task :URLSessionDataTask?, error : Error) in
            finished(nil, error as NSError?)
            }
        }
        }
}


// MARK:- func of request accessToken
extension NetworkTools{
    func loadAccessToken(code : String, finished: @escaping (_ result : [String : AnyObject]?, _ error : Error?)->()){
        //1. urlString 获取请求的URLString
        let urlString = "https://api.weibo.com/oauth2/access_token"
        
        
        //2.parameters  获取请求的参数
        let parameters = ["client_id" : app_key, "client_secret" : app_secret, "grant_type" : "authorization_code", "redirect_uri" : redirect_uri, "code" : code]
        
        
        //3.request
        request(methodType: .POST, urlString: urlString, parameter: parameters as [String : AnyObject]) { (result, error) in
            finished(result as! [String : AnyObject]?, error)
        }
        
    }
}
