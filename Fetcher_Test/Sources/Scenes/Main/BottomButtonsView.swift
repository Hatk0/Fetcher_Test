import SwiftUI

struct BottomButtonsView: View {
    @EnvironmentObject private var colorManager: ColorManager
    @StateObject private var mainViewModel = MainViewModel()
    
    @Binding var isFetching: Bool
    @Binding var infoText: String

    @State private var isToggled = false
    
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(Color(.systemGray3))
                .opacity(0.4)
                .frame(width: 343, height: 60)
            
            NavigationLink(destination: TodosView()) {
                Text("Show Results")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .background {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 155, height: 45)
                            .foregroundColor(canShowResults ? colorManager.greenColor : colorManager.greenColor.opacity(0.5))
                    }
            }
            .disabled(!canShowResults)
            .padding(.trailing, 160)
            
            ToggleSwitchView(isToggled: $mainViewModel.isToggled, isFetching: $isFetching)
                .onChange(of: mainViewModel.isToggled) { _ in
                    Task {
                        await mainViewModel.fetchBreweries()
                    }
                }
                .padding(.leading, 235)
        }
    }
    
    private var canShowResults: Bool {
        infoText == "The fetch successfully completed"
    }
}
