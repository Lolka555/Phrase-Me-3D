//
//  ARScreen.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 11.02.2023.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

//View для экрана с дополненной реальностью
struct ARScreen : View {
    
    @State private var isPlacementEnabled = false
    @State private var selectedModel = "robot_walk_idle.usdz"//: String?
    @State private var modelComfiredForPlacement: String?
    
    var models = ["tv_retro", "robot_walk_idle"]
    
    init() {
        let navBarAppearance = UINavigationController()
        navBarAppearance.navigationBar.largeTitleTextAttributes=[NSAttributedString.Key.foregroundColor:
        UIColor.white]
        
    }
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ARViewContainer(modelConfirmedForPlacement: self.$modelComfiredForPlacement)
                
                PlacementButtonView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.selectedModel, modelComfirmedForPlacement: self.$modelComfiredForPlacement)
            }.background(Color("Yellow").ignoresSafeArea())
        }.navigationBarTitle("", displayMode: .inline)
        
        
        
    }
    
    struct ARViewContainer: UIViewRepresentable {
        
        @Binding var modelConfirmedForPlacement: String?
        
        func makeUIView(context: Context) -> ARView {
            
            let arView = CustomARView(frame: .zero)//ARView(frame: .zero)
            
            
            
            return arView
            
        }
        
        func updateUIView(_ uiView: ARView, context: Context) {
            if let modelName = self.modelConfirmedForPlacement {
                print("Debug: adding model to scene")
                
                let fileName = modelName + ".usdz"
                
                let modelEntity = try! ModelEntity.load(named: "toy_drummer_idle")
                
                let anchorEntity = AnchorEntity(plane: .any)
                anchorEntity.addChild(modelEntity)
                
                uiView.scene.addAnchor(anchorEntity)
                
                modelEntity.playAnimation(modelEntity.availableAnimations[0].repeat(),
                                          transitionDuration: 0.5,
                                                startsPaused: false)
                DispatchQueue.main.async {
                    self.modelConfirmedForPlacement = nil
                }
            }
        }
    }
    
    class CustomARView: ARView, FEDelegate {
        let focusSquare = FESquare()
        
        required init(frame frameRect: CGRect) {
            super.init(frame: frameRect)
            
            focusSquare.viewDelegate = self
            focusSquare.delegate = self
            focusSquare.setAutoUpdate(to: true)
        
            self.setupARView()
        }
        func setupARView() {
            let config = ARWorldTrackingConfiguration()
            config.planeDetection = [.horizontal, .vertical]
            config.environmentTexturing = .automatic
            if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
                config.sceneReconstruction = .mesh
            }
            self.session.run(config)
        }
        @MainActor required dynamic init?(coder decoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

struct PlacementButtonView: View {
    
    @Binding var isPlacementEnabled: Bool
    var selectedModel: String?
    @Binding var modelComfirmedForPlacement: String?
    
    var body: some View {
        Button(action: {
            print("Debug: Confirm model")
            self.modelComfirmedForPlacement = self.selectedModel
        }) {
            Image(systemName: "checkmark")
                .frame(width: 60, height: 60)
                .font(.title)
                .background(Color.white.opacity(0.75))
                .cornerRadius(30)
                .padding(20)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ARScreen()
    }
}
#endif
