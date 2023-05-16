//
//  BrochureListViewModel.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import Foundation

@MainActor
class BrochureGridViewModel: ObservableObject {
    
    private var repository: BrochureRepository
    
    @Published var brochures: [Brochure] = []
    @Published var selectedBrochure: Brochure?
    
    init(repository: BrochureRepository) {
        self.repository = repository
    }
    
    @Sendable
    func loadBrochures() async {
        let result = await repository.fetch()
        
        switch result {
        case let .success(data):
            brochures = data
        case let .failure(error):
            // Error handling should be here
            print(error?.localizedDescription ?? "")
        }
    }
    
    func didSelectBrochure(_ brochure: Brochure?) {
        selectedBrochure = brochure
    }
}
