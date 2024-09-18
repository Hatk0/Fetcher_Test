import SwiftUI

struct ScanningButtonView: View {
    @EnvironmentObject private var colorManager: ColorManager

    @State private var isButtonPressed = false
    @State private var isAnimated = false
    
    var body: some View {
        VStack {
            Button {
                isButtonPressed = true
                withAnimation(
                    .easeInOut(duration: 1.4)
                    .repeatForever(autoreverses: true)
                ) {
                    isAnimated.toggle()
                }
            } label: {
                ZStack {
                    Circle()
                        .frame(width: isAnimated ? 264 : 320, height: isAnimated ? 264 : 320)
                        .foregroundColor(isButtonPressed ? colorManager.fourthGreenColor : colorManager.lightBlackColor)
                        .opacity(0.3)
                    
                    Circle()
                        .frame(width: isAnimated ? 240 : 260, height: isAnimated ? 240 : 260)
                        .foregroundColor(isButtonPressed ? colorManager.thirdGreenColor : colorManager.secondDarkGrayColor)
                    
                    Circle()
                        .frame(width: 210, height: 210)
                        .foregroundColor(isButtonPressed ? colorManager.secondGreenColor : colorManager.darkGrayColor)
                    
                    Circle()
                        .frame(width: 160, height: 160)
                        .foregroundColor(isButtonPressed ? colorManager.firstGreenColor : colorManager.grayColor)
                    
                    Image(systemName: "wifi")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(isButtonPressed ? colorManager.greenColor : .white)
                }
            }
        }
        .padding()
    }
}
