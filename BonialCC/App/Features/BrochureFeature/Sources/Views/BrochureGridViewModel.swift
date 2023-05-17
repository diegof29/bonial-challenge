//
//  BrochureListViewModel.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation

class BrochureGridViewModel: ObservableObject {
    
    private var repository: BrochureRepository
    
    @Published var brochures: [Brochure] = []
    @Published var selectedBrochure: Brochure?
    @Published var uiState = UIState()
    
    init(repository: BrochureRepository) {
        self.repository = repository
    }
    
    @MainActor
    @Sendable
    func loadBrochures() async {
        
        uiState.startLoading()
        let result = await repository.fetch(maxDistance: 5)
        uiState.didFinish(error: result.error)
        
        if let data = result.data {
            brochures = data
        }
    }
    
    func didSelectBrochure(_ brochure: Brochure?) {
        selectedBrochure = brochure
    }
}
