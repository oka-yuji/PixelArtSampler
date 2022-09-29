//
//  Model.swift
//  PixelArtSampler
//
//  Created by oka yuuji on 2022/09/30.
//

import SwiftUI

class Model: ObservableObject {
    @Published var selectedcolumn = 0
    @Published var selectedRow = 0
    
    func incremental(num: Int) -> Int {
        return num + 1
    }
    
    func decremental(num: Int) -> Int {
        return num - 1
    }
    
}
