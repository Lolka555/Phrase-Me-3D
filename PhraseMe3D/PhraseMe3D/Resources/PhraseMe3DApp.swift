//
//  PhraseMe3DApp.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 05.02.2023.
//

import SwiftUI

@main
struct PhraseMe3DApp: App {
    var body: some Scene {
        WindowGroup {
            if (UserDefaults().value(forKey: "token") != nil) { Words() }
            else { if (UserDefaults().value(forKey: "howToUse") != nil) { SignIn() } else { HowToUse() } }
        }
    }
}
