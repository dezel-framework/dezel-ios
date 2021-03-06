import JavaScriptCore
import DezelCoreJS

/**
 * @class JavaScriptExceptionWrapper
 * @since 0.1.0
 * @hidden
 */
internal final class JavaScriptExceptionWrapper {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * @property context
	 * @since 0.1.0
	 * @hidden
	 */
	internal var context: JavaScriptContext

	/**
	 * @property handler
	 * @since 0.1.0
	 * @hidden
	 */
	internal var handler: JavaScriptErrorHandler

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	internal init(context: JavaScriptContext, handler: @escaping JavaScriptErrorHandler) {
		self.context = context
		self.handler = handler
	}
}
