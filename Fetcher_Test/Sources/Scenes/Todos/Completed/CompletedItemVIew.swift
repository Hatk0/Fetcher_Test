import SwiftUI

struct CompletedItemView: View {
    var todo: Model
    var onTap: (Model) -> Void
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(.systemGray3))
                    .opacity(0.4)
                
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
            }
            
            Text(todo.title)
                .font(.custom("IBMPlexSans-Medium", size: 17))
            
            Spacer()
            
            Circle()
                .frame(width: 13, height: 13)
                .foregroundColor(.green)
        }
        .onTapGesture {
            onTap(todo)
        }
    }
}
