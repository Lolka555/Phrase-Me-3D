//
//  Model.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 18.02.2023.
//

import Foundation

struct PhrasalVerb: Hashable {
    var word, wordId: String
}

class globalVerb: ObservableObject {
    @Published var verb = ""
    @Published var verbID = ""
}

