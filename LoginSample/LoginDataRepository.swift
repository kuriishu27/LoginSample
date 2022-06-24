import Foundation
import Combine

typealias Token = String

protocol LoginProvider {
	func authenticate(email: String, password: String) -> AnyPublisher<Token, Error>
	// func forgotPassword() -> AnyPublisher<Never, Error>
}

/// This is the production component that deals with the real API
final class LoginDataRepository: LoginProvider {
	// View - ViewModel - REP & (UD?) - APIs
	func authenticate(email: String, password: String) -> AnyPublisher<Token, Error> {
		return Just("Token")
			.setFailureType(to: Error.self)
			.eraseToAnyPublisher()
	}
}
