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
        let url = "http://localhost:8080/login/user?email=\(email)&password=\(password)"
        
        AF.request(url, method: .get).validate().responseString() { response in
            switch response.result{
            case .success(let value):
                let answer = value
                con!(answer, "Succed")
            case .failure(let error):
                print(error.localizedDescription)
                con!("", error.localizedDescription)
            }
        }
    }
    
}
