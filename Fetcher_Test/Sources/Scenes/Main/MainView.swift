import SwiftUI

struct MainView: View {
    var body: some View {
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
    }
}

#Preview {
    MainView()
}
