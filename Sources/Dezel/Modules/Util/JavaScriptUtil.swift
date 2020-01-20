import UIKit

/**
 * @class JavaScriptUtil
 * @super JavaScriptClass
 * @since 0.1.0
 */
open class JavaScriptUtil: JavaScriptClass {

	//--------------------------------------------------------------------------
	// MARK: JS Functions
	//--------------------------------------------------------------------------

	/**
	 * @property jsFunction_importClass
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsFunction_importClass(callback: JavaScriptFunctionCallback) {
		if let result = self.context.classes[callback.argument(0).string] {
			callback.returns(result)
		}
	}

	/**
	 * @property jsFunction_importObject
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsFunction_importObject(callback: JavaScriptFunctionCallback) {
		if let result = self.context.objects[callback.argument(0).string] {
			callback.returns(result)
		}
	}

	/**
	 * @property jsFunction_registerApplication
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsFunction_registerApplication(callback: JavaScriptFunctionCallback) {
		if let application = callback.argument(0).cast(JavaScriptApplication.self) {
			self.context.controller.register(application: application)
		}
	}

	/**
	 * @property jsFunction_reload
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsFunction_reload(callback: JavaScriptFunctionCallback) {
		self.context.controller.reload()
	}

	/**
	 * @property jsFunction_reloadStyles
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsFunction_reloadStyles(callback: JavaScriptFunctionCallback) {
		self.context.controller.reloadStyles()
	}
}
