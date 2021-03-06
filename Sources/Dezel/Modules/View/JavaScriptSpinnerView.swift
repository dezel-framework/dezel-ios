import UIKit

/**
 * @class JavaScriptSpinnerView
 * @super JavaScriptView
 * @since 0.1.0
 */
open class JavaScriptSpinnerView: JavaScriptView {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * @property view
	 * @since 0.1.0
	 * @hidden
	 */
	private var view: SpinnerView {
		return self.content as! SpinnerView
	}

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @inherited
	 * @method createContentView
	 * @since 0.1.0
	 */
	override open func createContentView() -> SpinnerView {
		return SpinnerView(frame: .zero)
	}

	//--------------------------------------------------------------------------
	// MARK: JS Properties
	//--------------------------------------------------------------------------

	/**
	 * @property spin
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var spin = JavaScriptProperty(boolean: false) { value in
		self.view.spin = value.boolean
	}

	/**
	 * @property tint
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open lazy var tint = JavaScriptProperty(string: "#000") { value in
		self.view.color = UIColor(color: value)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_spin
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_spin(callback: JavaScriptGetterCallback) {
		callback.returns(self.spin)
	}

	/**
	 * @method jsSet_spin
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_spin(callback: JavaScriptSetterCallback) {
		self.spin.reset(callback.value, lock: self)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_tint
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_tint(callback: JavaScriptGetterCallback) {
		callback.returns(self.tint)
	}

	/**
	 * @method jsSet_tint
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsSet_tint(callback: JavaScriptSetterCallback) {
		self.tint.reset(callback.value, lock: self, parse: true)
	}
}
