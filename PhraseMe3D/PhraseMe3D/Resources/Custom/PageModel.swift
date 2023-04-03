//
//  PageModel.swift
//  SlidingIntroScreen
//
//  Created by Federico on 18/03/2022.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "work", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Welcome to PhraseMe3D", description: "The best app to learn phrasal verbs", imageUrl: "howToUseWelcome", tag: 0),
        
        Page(name: "Sign Up", description: "Enter the required data for registration", imageUrl: "howToUseSignUp", tag: 1),
        
        Page(name: "Sign In", description: "Enter your email and password", imageUrl: "howToUseSignIn", tag: 2),
        
        Page(name: "Words", description: "Сhoose the word you want to see", imageUrl: "howToUseWords", tag: 3),
        
        Page(name: "Focus", description: "Point the camera at a flat surface and wait until the square in the center has a full outline", imageUrl: "howToUseSquare", tag: 4),
        
        Page(name: "Model", description: "Press the button in the bottom of the screen and enjoy", imageUrl: "howToUseModel", tag: 5),
    ]
}
