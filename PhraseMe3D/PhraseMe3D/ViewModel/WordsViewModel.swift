//
//  WordsViewModel.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 19.02.2023.
//

import Foundation
import Alamofire
import SwiftyJSON

//ViewModel для экрана со словами
class WordsViewModel: ObservableObject{
    
    @Published var verbs: [PhrasalVerb] = []
    
    init() {
        getWords()
    }
    
    func getWords(con: ((_ result: String, _ error: String) -> Void )? = nil) {
        let url = "http://95.165.105.133:1221/api/get_all_models"
        
        AF.request(url, method: .get).validate().response() { response in
            switch response.result{
            case .success(let value):
                let answer = JSON(value!)
                
                for i in answer {
                    print(i)
                    self.verbs.append(PhrasalVerb(word: "\(i.0)", wordId: "\(i.1)"))
                }
                
                self.verbs.sort { $0.word < $1.word }
            case .failure(let error):
                print(error.localizedDescription)
                con?("", error.localizedDescription)
            }
        }
    }
}
