//
//  ContentView.swift
//  BonialCC
//
//  Created by Diego Pais on 16.05.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BrochureGridView(
            viewModel: BrochureGridViewModel(
                repository: DefaultBrochureRepository(
                    dataSource: JSONDataSource()
                )
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
