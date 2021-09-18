import Foundation
@testable import Dezel
@testable import DezelCoreUI
@testable import DezelCoreJS

class JavaScriptContextTestClassB: JavaScriptClass {
	@objc override func jsFunction_constructor(callback: JavaScriptFunctionCallback) {
		JavaScriptContextTest.testConstructorBCallback?(callback)
	}
}
