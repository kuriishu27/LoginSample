import SwiftUI

struct LoginView: View {
	@ObservedObject var viewModel: LoginViewModel
	
	var body: some View {
		NavigationView {
			VStack {
				TextField("Email", text: $viewModel.email)
				TextField("Password", text: $viewModel.password)

				Button {
					viewModel.action.send(.didTapLoginButton)
				} label: {
					Text("Login")
				}
			}
		}

	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView(viewModel: LoginViewModel(repository: LoginDataRepository(), localStorage: UserDefaultsStorage()))
	}
}
