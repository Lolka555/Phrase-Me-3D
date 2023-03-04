//
//  SingInViewModel.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 15.02.2023.
//

import Foundation
import Foundation
import Alamofire
import SwiftyJSON


//ViewModel для экрана с авторизацией
class SignInViewModel: ObservableObject{
    
//    Функия для отправки запроса авторизации
    func SignInAction(email: String, password: String, con: ((_ result: String, _ error: String) -> Void )? = nil) {
        let url = "http://95.165.105.133:1221/login/user?email=\(email)&password=\(password)"
        
        AF.request(url, method: .get).validate().response() { response in
            switch response.result{
            case .success(let value):
                let answer = JSON(value!)
                let token = answer["token"].stringValue
                
                UserDefaults().set(token, forKey: "token")
                print(token)
                
                con!(token, "Succed")
            case .failure(let error):
                print(error.localizedDescription)
                con!("", error.localizedDescription)
            }
        }
    }
    
}
