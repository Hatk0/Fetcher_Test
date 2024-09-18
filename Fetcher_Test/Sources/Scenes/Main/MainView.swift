import SwiftUI

struct MainView: View {
    @StateObject private var mainViewModel = MainViewModel()
    @State private var infoViewState: InfoViewState = .idle
    @State private var infoText: String = "Tap on the button to fetch todos"
    @State private var isFetching: Bool = false
    @State private var isAnimating: Bool = false

    var body: some View {
        NavigationView {
            CustomNavigationBar(title: "Fetcher", action: { }, showBackButton: false) {
                VStack {
                    Spacer()
                    
                    ScanningButtonView(isAnimating: $isAnimating, action: fetchBreweries)
                    
                    Spacer()
                    
                    InfoView(state: infoViewState, text: infoText)
                        .padding(.vertical)
                    
                    BottomButtonsView()
                        .padding(.bottom, 30)
                }
            }
        }
    }
    
    private func fetchBreweries() {
        infoViewState = .loading
        infoText = "It’ll take a couple of seconds"
        isFetching = true
        isAnimating = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            Task {
                await mainViewModel.fetchBreweries()
                
                DispatchQueue.main.async {
                    infoViewState = .success
                    infoText = "The fetch successfully completed"
                    isFetching = false
                    isAnimating = false
                }
            }
        }
    }
}
