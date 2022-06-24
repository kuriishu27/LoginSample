import SwiftUI

@main
struct LoginSampleApp: App {
	var body: some Scene {
		WindowGroup {
			LoginView(viewModel: LoginViewModel(repository: LoginDataRepository(), localStorage: UserDefaultsStorage()))
		}
	}
}
