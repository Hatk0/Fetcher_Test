import SwiftUI

struct MainView: View {
    @StateObject private var mainViewModel = MainViewModel()
    @State private var infoViewState: InfoViewState = .idle
    @State private var infoText: String = "Tap on the button to fetch todos"
    @State private var isFetching: Bool = false
    @State private var isAnimating: Bool = false
    @State private var showTodos: Bool = false
    
    var body: some View {
        NavigationView {
            CustomNavigationBar(
                title: "Fetcher",
                action: { },
                showBackButton: false
            ) {
                VStack {
                    Spacer()
                    
                    ScanningButtonView(isAnimating: $isAnimating, action: fetchTodos)
                    
                    Spacer()
                    
                    InfoView(state: infoViewState, text: infoText)
                        .padding(.vertical)
                    
                    BottomButtonsView(
                        mainViewModel: mainViewModel,
                        isFetching: $isFetching,
                        infoText: $infoText
                    )
                    .padding(.bottom, 30)
                }
            }
            .onAppear {
                resetState()
            }
        }
    }
}

private extension MainView {
    func fetchTodos() {
        infoViewState = .loading
        infoText = "It’ll take a couple of seconds"
        isFetching = true
        isAnimating = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            Task {
                await mainViewModel.fetchToDos()
                
                DispatchQueue.main.async {
                    infoViewState = .success
                    infoText = "The fetch successfully completed"
                    isFetching = false
                    isAnimating = false
                }
            }
        }
    }
    
    func resetState() {
        infoViewState = .idle
        infoText = "Tap on the button to fetch todos"
        isFetching = false
        isAnimating = false
        showTodos = false
        mainViewModel.isToggled = false
    }
}
