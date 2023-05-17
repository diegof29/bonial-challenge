//
//  BrochureListView.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import SwiftUI
import Factory

public struct BrochureGridView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @StateObject private var viewModel: BrochureGridViewModel
    
    private var theme: BTheme
    
    private let columnsCompact = [
        GridItem(.flexible(), alignment: .top),
        GridItem(.flexible(), alignment: .top),
    ]
    private let columnsRegular = [
        GridItem(.flexible(), alignment: .top),
        GridItem(.flexible(), alignment: .top),
        GridItem(.flexible(), alignment: .top)
    ]
    
    private var useLandscapeLayout: Bool {
        return verticalSizeClass == .compact || horizontalSizeClass == .regular
    }
    
    public init(theme: BTheme, viewModel: BrochureGridViewModel) {
        self.theme = theme
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            NavigationStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(
                        columns: useLandscapeLayout ? columnsRegular : columnsCompact,
                        spacing: theme.spacing.large
                    ) {
                        ForEach(viewModel.brochures) { brochure in
                            BrochureGridItemView(theme: theme, brochure: brochure) { selectedBrochure in
                                withAnimation {
                                    viewModel.didSelectBrochure(selectedBrochure)
                                }
                            }
                            .accessibilityIdentifier("brochure-\(brochure.id)")
                        }
                    }
                    .padding(.top, theme.spacing.large)
                }
                .accessibilityIdentifier("brochures-list")
                .padding(.horizontal, theme.spacing.large)
                .navigationTitle("Brochures")
                .navigationBarTitleDisplayMode(.inline)
                .task(viewModel.loadBrochures)
            }
            
            if let selectedBrochure = viewModel.selectedBrochure {
                BrochureDetailView(brochure: selectedBrochure) {
                    withAnimation {
                        viewModel.didSelectBrochure(nil)
                    }
                }
                .accessibilityIdentifier("brochure-details-\(selectedBrochure.id)")
                .ignoresSafeArea()
            }
        }
    }
}

struct BrochureGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrochureGridView(
            theme: Container.shared.theme(),
            viewModel: BrochureGridViewModel(
                repository: DefaultBrochureRepository(
                    dataSource: MockBrochureDataSource(brochures: [.premiumTemplate, .template, .template2km, .template1km])
                )
            )
        )
    }
}
