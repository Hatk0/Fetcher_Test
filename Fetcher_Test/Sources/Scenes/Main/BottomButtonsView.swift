import SwiftUI

struct BottomButtonsView: View {
    @EnvironmentObject private var colorManager: ColorManager

    @State private var isToggled = false
    
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(Color(.systemGray3))
                .opacity(0.4)
                .frame(width: 343, height: 60)
            
            Button {
                
            } label: {
                Text("Show Results")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .background {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 155, height: 45)
                            .foregroundColor(colorManager.greenColor)
                    }
            }
            .padding(.trailing, 160)
            
            ToggleSwitchView(isToggled: $isToggled)
                .padding(.leading, 235)
        }
    }
}

#Preview {
    BottomButtonsView()
}
