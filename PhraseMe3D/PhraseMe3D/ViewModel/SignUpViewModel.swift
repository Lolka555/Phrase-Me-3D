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

//ViewModel для экрана с регистрацией
class SignUpViewModel: ObservableObject{
    
    
    //    функция для отправки запроса на регистрацию
    func SignUpAction(email: String, password: String, username: String, con: ((_ result: String, _ error: String) -> Void )? = nil) {
        
        let body: [String: String] = [
            "username": "\(username)",
            "password": "\(password)",
            "email": "\(email)"
        ]
        
        let url = "http://95.165.105.133:1221/register/user"
        AF.upload(multipartFormData: { (multiFormData) in
                for (key, value) in body {
                    multiFormData.append(Data(value.utf8), withName: key)
                }
            }, to: url).response { response in
                switch response.result {
                case .success(let value):
                    let answer = JSON(value!)
                    print(answer)
                    
                    if answer["status"] == "success" { con!(answer["status"].stringValue, "Succed") }
                    else { con!(answer["status"].stringValue, "Error") }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    con!("", error.localizedDescription)
                }
            }
        }
}
