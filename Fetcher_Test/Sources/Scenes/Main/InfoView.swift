import SwiftUI

struct InfoView: View {
    let text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(.systemGray3))
                .opacity(0.4)
                .frame(width: 343, height: 60)
            
            HStack {
                Image(systemName: "hand.tap")
                    .resizable()
                    .frame(width: 18, height: 22)
                
                Text(text)
                    .font(.custom("IBMPlexSans-Medium", size: 14))
                    .padding(.leading, 10)
            }
            .foregroundColor(.white)
            .opacity(0.7)
            .padding(.trailing, 50)
        }
    }
}
