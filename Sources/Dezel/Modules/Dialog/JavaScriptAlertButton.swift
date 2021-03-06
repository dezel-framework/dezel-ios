import UIKit

/**
 * @class JavaScriptAlertButton
 * @super JavaScriptClass
 * @since 0.1.0
 */
open class JavaScriptAlertButton: JavaScriptClass {

	//--------------------------------------------------------------------------
	// MARK: JS Properties
	//--------------------------------------------------------------------------

	/**
	 * @property label
	 * @since 0.1.0
	 * @hidden
	 */
	open lazy var label = JavaScriptProperty(string: "")

	/**
	 * @property image
	 * @since 0.1.0
	 * @hidden
	 */
	open lazy var image = JavaScriptProperty()

	/**
	 * @property style
	 * @since 0.1.0
	 * @hidden
	 */
	open lazy var style = JavaScriptProperty(string: "normal")

	//-------------------------------------------------------------------------

	/**
	 * @method jsGet_label
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_label(callback: JavaScriptSetterCallback) {
		callback.returns(self.label)
	}

	/**
	 * @method jsSet_label
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_label(callback: JavaScriptSetterCallback) {
		self.label.reset(callback.value, lock: self)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_image
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_image(callback: JavaScriptGetterCallback) {
		callback.returns(self.image)
	}

	/**
	 * @method jsSet_style
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_image(callback: JavaScriptSetterCallback) {
		self.image.reset(callback.value, lock: self)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_style
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_style(callback: JavaScriptSetterCallback) {
		callback.returns(self.style)
	}

	/**
	 * @method jsSet_style
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_style(callback: JavaScriptSetterCallback) {
		self.style.reset(callback.value, lock: self)
	}
}
