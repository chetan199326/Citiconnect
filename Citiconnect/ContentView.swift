//
//  ContentView.swift
//  Citiconnect
//
//  Created by Apple on 24/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = CitiesViewModel()
    @State private var isDarkMode = false
    @State private var expandedSection: Set<String> = []
    
    var body: some View {
        
        NavigationView {
            VStack{
                if viewModel.isDataLoaded {
                    List {
                        ForEach(viewModel.citiesByState.keys.sorted(),id:\.self) { state in
                            DisclosureGroup(
                                isExpanded: Binding(
                                    get: {expandedSection.contains(state)},
                                    set: {
                                        newValue in
                                        if newValue {
                                            expandedSection.insert(state)
                                        } else {
                                            expandedSection.remove(state)
                                        }
                                    }
                                )
                            ) {
                                ForEach(viewModel.citiesByState[state] ?? [], id: \.id) { city in
                                    Text(city.city)
                                        .padding(.vertical, 5)
                                }
                            } label: {
                                Text(state).font(.headline)
                                
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                    .navigationTitle("Cities in Australia")
                    .navigationBarItems(trailing: Button(action: {
                        viewModel.reverseCitiesOrder()
                    }) {
                        Image(systemName: "arrow.up.arrow.down.circle.fill")
                    }
                    )
                } else {
                    Text("Loading data...")
                        .onAppear {
                            viewModel.fetchCitiesData()
                        }
                }
            }
            .onAppear {
                // DARK MODE Check
                isDarkMode = UITraitCollection.current.userInterfaceStyle == .light
            }
        }
        .background(.clear)
        .preferredColorScheme(isDarkMode ? .light : .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
