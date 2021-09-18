import Foundation
@testable import Dezel
@testable import DezelCoreUI
@testable import DezelCoreJS

class JavaScriptContextTestClassA: JavaScriptClass {
	@objc override func jsFunction_constructor(callback:JavaScriptFunctionCallback) {
		JavaScriptContextTest.testConstructorACallback?(callback)
	}
}
