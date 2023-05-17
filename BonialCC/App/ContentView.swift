//
//  ContentView.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import SwiftUI
import Factory

struct ContentView: View {
    var body: some View {
        BrochureGridView(
            theme: Container.shared.theme(),
            viewModel: BrochureGridViewModel(
                repository: Container.shared.brochureRepository()!
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
