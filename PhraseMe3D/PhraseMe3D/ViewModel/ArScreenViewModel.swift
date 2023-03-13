//
//  WordsViewModel.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 19.02.2023.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealityToolkit
import RealityFoundation

@MainActor   
class ArScreenViewModel: ObservableObject{
    
    @Published var modelEntity: Entity?
    
    init() {
        print("NIce1")
        getModel()
        print("NIce2")
    }
        
    func getModel() {
        Task {
            var newModel = try? await RealityToolkit.loadEntity(
                contentsOf: URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/vintagerobot2k/robot_walk_idle.usdz")!)
            DispatchQueue.main.async {
                self.modelEntity = newModel
                }

        }
    }
}
