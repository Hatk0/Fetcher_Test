import SwiftUI

struct ToggleSwitchView: View {
    @EnvironmentObject private var colorManager: ColorManager

    @Binding var isToggled: Bool
    
    @State private var buttonColor: Color = .gray
    @State private var buttonOffset: CGFloat = 0
    
    let capsuleSize: CGFloat
    
    init(isToggled: Binding<Bool>, capsuleSize: CGFloat = 60) {
        self._isToggled = isToggled
        self.capsuleSize = capsuleSize
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 71, height: 36)
                .foregroundStyle(buttonColor)
                .contentShape(Rectangle())
            
            HStack {
                if isToggled {
                    Image(systemName: "wifi")
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .padding(.leading, 5)
                }
                
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                    .offset(x: buttonOffset)
                    .contentShape(Circle())
                
                if !isToggled {
                    Image(systemName: "wifi.slash")
                        .foregroundColor(.white)
                        .opacity(0.5)
                        .padding(.trailing, 5)
                }
            }
            .onTapGesture {
                toggleButton()
            }
        }
        .onAppear {
            initializeToggleState()
        }
        .onChange(of: isToggled) { newValue in
            updateToggleState(animated: true)
        }
    }
}

private extension ToggleSwitchView {
    func initializeToggleState() {
        updateToggleState(animated: false)
    }
    
    func updateToggleState(animated: Bool = true) {
        let animation = animated ? Animation.easeOut(duration: 0.2) : nil
        withAnimation(animation) {
            buttonOffset = isToggled ? -1 : 1
            buttonColor = isToggled ? colorManager.greenColor : colorManager.grayColor
        }
    }
    
    func toggleButton() {
        withAnimation(.easeOut(duration: 0.2)) {
            isToggled.toggle()
            buttonOffset = isToggled ? -1 : 1
            buttonColor = isToggled ? colorManager.greenColor : colorManager.grayColor
        }
    }
}
