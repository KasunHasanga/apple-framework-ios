//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by kasun Hasanga on 2023-11-27.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    

    var body: some View {
        NavigationStack{
         
               List{
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(destination: FrameworkDetailView(framework: framework, isShowingDetailView: $viewModel.isShowingDetailView)){
                        FrameworkTitleView(framework: framework)
                    }

                }
            }
           .navigationTitle("🍎 Framework")
//            .sheet(isPresented: $viewModel.isShowingDetailView ,content:{
//                    FrameworkDetailView(framework: viewModel.selectedFramework! ,isShowingDetailView: $viewModel.isShowingDetailView)                })
        }.accentColor(Color(.label))
    }
}

#Preview {
    FrameworkGridView()
}

