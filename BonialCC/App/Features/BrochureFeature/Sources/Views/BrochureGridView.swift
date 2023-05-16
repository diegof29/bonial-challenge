//
//  BrochureListView.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import SwiftUI

struct BrochureGridView: View {
    
    @StateObject var viewModel: BrochureGridViewModel
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        if let selectedBrochure = viewModel.selectedBrochure {
            BrochureDetailView(brochure: selectedBrochure) {
                withAnimation {
                    viewModel.didSelectBrochure(nil)
                }
            }
            .accessibilityIdentifier("brochure-details-\(selectedBrochure.id)")
        }else {
            NavigationStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.brochures) { brochure in
                            BrochureGridItemView(brochure: brochure) { b2 in
                                withAnimation {
                                    viewModel.didSelectBrochure(b2)
                                }
                            }
                            .accessibilityIdentifier("brochure-\(brochure.id)")
                        }
                    }
                }
                .accessibilityIdentifier("brochures-list")
                .padding(16)
                .navigationTitle("Brochures")
                .task(viewModel.loadBrochures)
            }
        }
    }
}

struct BrochureListView_Previews: PreviewProvider {
    static var previews: some View {
        BrochureGridView(
            viewModel: BrochureGridViewModel(
                repository: DefaultBrochureRepository(
                    dataSource: JSONDataSource()
                )
            )
        )
    }
}
