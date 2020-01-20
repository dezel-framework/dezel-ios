import UIKit

/**
 * @class JavaScriptNavigator
 * @super JavaScriptClass
 * @since 0.1.0
 */
open class JavaScriptNavigator: JavaScriptObject {

	//--------------------------------------------------------------------------
	// MARK: JS Properties
	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_userAgent
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_userAgent(callback: JavaScriptGetterCallback) {
		callback.returns("Dezel/0.1.0")
	}
}
