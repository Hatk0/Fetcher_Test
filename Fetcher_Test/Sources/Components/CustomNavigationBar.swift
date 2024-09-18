import SwiftUI

struct CustomNavigationBar: View {
    let title: String
    let action: (() -> Void)?
    let showBackButton: Bool

    var body: some View {
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
            
            Spacer()
        }
        .padding()
    }
}
