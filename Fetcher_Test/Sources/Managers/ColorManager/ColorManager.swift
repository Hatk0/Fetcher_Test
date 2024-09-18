import SwiftUI

final class ColorManager: ObservableObject {
    @Published var color: ColorScheme
    @Published var textColor: Color
    @Published var grayColor: Color
    @Published var darkGrayColor: Color
    @Published var secondDarkGrayColor: Color
    @Published var lightBlackColor: Color
    @Published var greenColor: Color
    @Published var firstGreenColor: Color
    @Published var secondGreenColor: Color
    @Published var thirdGreenColor: Color
    @Published var fourthGreenColor: Color

    
    init(initialColorScheme: ColorScheme) {
        self.color = initialColorScheme
        self.textColor = Color(hex: "#EBEEE9")
        self.grayColor = Color(hex: "#292C29")
        self.darkGrayColor = Color(hex: "#1E201E")
        self.secondDarkGrayColor = Color(hex: "#181818")
        self.lightBlackColor = Color(hex: "#151515")
        self.greenColor = Color(hex: "#BAE488")
        self.firstGreenColor = Color(hex: "#445235")
        self.secondGreenColor = Color(hex: "#303926")
        self.thirdGreenColor = Color(hex: "#20261B")
        self.fourthGreenColor = Color(hex: "#171A14")
    }
}
