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
        NavigationView{
           ScrollView {
               LazyVGrid(columns: viewModel.columns, content: {
                ForEach(MockData.frameworks) { framework in
                    FrameworkTitleView(framework: framework).onTapGesture {
                        viewModel.selectedFramework = framework
                    }
                }
            })}
           .navigationTitle("🍎 Framework")
            .sheet(isPresented: $viewModel.isShowingDetailView ,content:{
                    FrameworkDetailView(framework: viewModel.selectedFramework! ,isShowingDetailView: $viewModel.isShowingDetailView)                })
        }
    }
}

#Preview {
    FrameworkGridView()
}

