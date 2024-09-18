import SwiftUI

struct CustomNavigationBar<Content: View>: View {
    let title: String
    let action: (() -> Void)?
    let showBackButton: Bool
    let content: Content
    
    init(
        title: String,
        action: (() -> Void)?,
        showBackButton: Bool,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.action = action
        self.showBackButton = showBackButton
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .top) {
            content
                .padding(.top)
            
            HStack(alignment: .center) {
                if showBackButton, let action = action {
                    Button {
                        action()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .frame(width: 14, height: 6)
                            .foregroundColor(.white)
                    }
                }

                Spacer()
                
                Text(title)
                    .font(.custom("IBMPlexSans-Bold", size: 20))
                    .foregroundColor(.white)
                    .padding(.trailing, showBackButton ? 10 : 0)
                
                Spacer()
            }
            .padding()
        }
    }
}
