import SwiftUI

struct TodosView: View {
    @EnvironmentObject private var colorManager: ColorManager
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var mainViewModel: MainViewModel
    
    var body: some View {
        CustomNavigationBar(
            title: "Todos",
            action: { presentationMode.wrappedValue.dismiss() },
            showBackButton: true
        ) {
            VStack {
                InfoView(state: .idle, text: "Tap on the todo to change status")
                    .padding(.top, 60)
                
                NotCompletedListView(notCompletedTodos: mainViewModel.notCompletedTodos)
                    .padding(.top, 20)
                
                CompletedListView(completedTodos: mainViewModel.completedTodos)
                    .padding(.top, 20)
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
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
        .navigationBarBackButtonHidden()
    }
}
