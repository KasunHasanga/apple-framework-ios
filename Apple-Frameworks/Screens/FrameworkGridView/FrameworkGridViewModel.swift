//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by kasun Hasanga on 2023-11-27.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject{
    
    var selectedFramework :Framework?{
        didSet{ isShowingDetailView = true }
    }
    
    @Published var isShowingDetailView = false
    
    let columns :[GridItem]=[GridItem(.flexible()) ,
                             GridItem(.flexible()) ,
                             GridItem(.flexible())  ]
    
    
}
