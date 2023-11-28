//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by kasun Hasanga on 2023-11-27.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns :[GridItem]=[GridItem(.flexible()) ,
                             GridItem(.flexible()) ,
                             GridItem(.flexible())  ]
    
    var body: some View {
        NavigationView{
           ScrollView {
               LazyVGrid(columns: columns, content: {
                ForEach(MockData.frameworks) { framework in
                    FrameworkTitleView(framework: framework).onTapGesture {
                        viewModel.selectedFramework = framework
                    }
                }
            })}.navigationTitle("🍎 Framework")
                .sheet(isPresented: $viewModel.isShowingDetailView ,content:{
                    FrameworkDetailView(framework: viewModel.selectedFramework! ,isShowingDetailView: $viewModel.isShowingDetailView)                })
        }
      
      
    }
}

#Preview {
    FrameworkGridView()
}

struct FrameworkTitleView  :View{
    
    let framework:Framework
    
    var body: some View {
        VStack{
            
            Image(framework.imageName)
                .resizable()
                .frame(width: 90,height: 90)
            
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }.padding()
    } 
    
   
    
}
