import SwiftUI

@main
struct Fetcher_TestApp: App {
    @StateObject private var colorManager = ColorManager(initialColorScheme: .dark)

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(colorManager)
                .preferredColorScheme(.dark)
        }
    }
}
