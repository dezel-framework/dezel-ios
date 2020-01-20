import UIKit

/**
 * @class JavaScriptLocation
 * @super JavaScriptClass
 * @since 0.1.0
 */
open class JavaScriptLocation: JavaScriptObject {

	//--------------------------------------------------------------------------
	// MARK: JS Properties
	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_protocol
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_protocol(callback: JavaScriptGetterCallback) {
		callback.returns("http:")
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_hostname
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_hostname(callback: JavaScriptGetterCallback) {
		callback.returns("localhost")
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_port
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_port(callback: JavaScriptGetterCallback) {
		callback.returns("")
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_href
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_href(callback: JavaScriptGetterCallback) {
		callback.returns("http://localhost")
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_search
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_search(callback: JavaScriptGetterCallback) {
		callback.returns("")
	}

	//--------------------------------------------------------------------------
	// MARK: JS Methods
	//--------------------------------------------------------------------------

	/**
	 * @method jsFunction_reload
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsFunction_reload(callback: JavaScriptFunctionCallback) {

		if (callback.arguments == 1) {
			let options = callback.argument(0)
			if (options.isObject &&
				options.property("mode").string == "styles") {
				self.context.controller.reloadStyles()
				return
			}
		}

		self.context.controller.reload()
	}
}
