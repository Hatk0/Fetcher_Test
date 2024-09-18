import SwiftUI

struct ScanningButtonView: View {
    @EnvironmentObject private var colorManager: ColorManager

    @Binding var isAnimating: Bool
    let action: () -> Void

    @State private var isButtonPressed = false
    @State private var circleSize: CGFloat = 320
    @State private var innerCircleSize: CGFloat = 260
    @State private var middleCircleSize: CGFloat = 210
    @State private var centerCircleSize: CGFloat = 160

    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: circleSize, height: circleSize)
                        .foregroundColor(isButtonPressed ? colorManager.fourthGreenColor : colorManager.lightBlackColor)
                        .opacity(0.3)

                    Circle()
                        .frame(width: innerCircleSize, height: innerCircleSize)
                        .foregroundColor(isButtonPressed ? colorManager.thirdGreenColor : colorManager.secondDarkGrayColor)

                    Circle()
                        .frame(width: middleCircleSize, height: middleCircleSize)
                        .foregroundColor(isButtonPressed ? colorManager.secondGreenColor : colorManager.darkGrayColor)

                    Circle()
                        .frame(width: centerCircleSize, height: centerCircleSize)
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
        .onChange(of: isAnimating) { newValue in
            if newValue {
                withAnimation(
                    .easeInOut(duration: 1.4)
                        .repeatForever(autoreverses: true)
                ) {
                    isButtonPressed = true
                    circleSize = 264
                    innerCircleSize = 240
                }
            } else {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isButtonPressed = false
                    circleSize = 320
                    innerCircleSize = 260
                    middleCircleSize = 210
                    centerCircleSize = 160
                }
            }
        }
    }
}
