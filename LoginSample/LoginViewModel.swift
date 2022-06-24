import Foundation
import Combine

final class LoginViewModel: ObservableObject {
	// 1. Actions can replace the Use cases
	enum LoginAction {
		case didTapLoginButton
		case receiveLoginResponse(Result<Token, Error>)
		
		case rememberPasswordTapped
		case receivePasswordResponse(Result<Bool, Error>)
	}
	
	// 2. Error
	enum LoginError {
		case message(String)
	}
	
	// 3. Declare the properties
	@Published var email: String = ""
	@Published var emailError: String?
	@Published var password: String = ""
	@Published var passwordError: String?

	@Published var isPasswordRemembered: Bool = false
	
	let action: PassthroughSubject<LoginAction, Never> = .init()
	
	// 4. Dependencies
	let repository: LoginProvider
	let localStorage: UserDefaultsStorage
	
	private var subscriptions: Set<AnyCancellable> = []
	
	init(repository: LoginProvider, localStorage: UserDefaultsStorage) {
		self.repository = repository
		self.localStorage = localStorage
		
		action
			.sink { action in
				switch action {
				case .didTapLoginButton:
					self.authenticate()
				case let .receiveLoginResponse(.success(token)):
					// you can store you token in some SessionStorage or Manager
					break
				case let .receiveLoginResponse(.failure(error)):
					break
				default: break
				}
			}
			.store(in: &subscriptions)
	}

	func authenticate() {
		repository.authenticate(email: email, password: password)
			.sink { _ in
				
			} receiveValue: { token in
				self.action.send(.receiveLoginResponse(.success(token)))
			}
			.store(in: &subscriptions)
	}
}
