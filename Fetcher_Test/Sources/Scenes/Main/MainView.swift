import SwiftUI

struct MainView: View {
    @StateObject private var mainViewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            CustomNavigationBar(title: "Fetcher", action: { }, showBackButton: false) {
                VStack {
                    Spacer()
                    
                    ScanningButtonView()
                    
                    Spacer()
                    
                    InfoView(text: "Tap on the button to fetch todos")
                        .padding(.vertical)
                    
                    BottomButtonsView()
                        .padding(.bottom, 30)
                }
            }
            .onAppear {
                Task {
                    await mainViewModel.fetchBreweries()
                }
            }
        }
    }
}
