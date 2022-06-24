import XCTest
import Combine
@testable import LoginSample

// Mocks, Stubs and Spies
final class MockLoginDataRepository: LoginProvider {
	func authenticate(email: String, password: String) -> AnyPublisher<Token, Error> {
		Just("Token")
			.setFailureType(to: Error.self)
			.eraseToAnyPublisher()
	}

}

class LoginSampleTests: XCTestCase {
    override func setUpWithError() throws {
			
    }

    override func tearDownWithError() throws {
			
    }

    func testExample() throws {
    }
}
