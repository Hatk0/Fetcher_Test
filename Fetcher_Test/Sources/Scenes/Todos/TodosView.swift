import SwiftUI

struct TodosView: View {
    @EnvironmentObject private var colorManager: ColorManager
    
    var body: some View {
        CustomNavigationBar(title: "Todos", action: { }, showBackButton: true) {
            VStack {
                InfoView(text: "Tap on the todo to change status")
                    .padding(.top, 60)
                
                NotCompletedListView()
                    .padding(.top, 20)
                
                CompletedListView()
                    .padding(.top, 20)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Done")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .background {
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 343, height: 45)
                                .foregroundColor(colorManager.greenColor)
                        }
                }
                .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    TodosView()
}
