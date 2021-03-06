import UIKit
import AudioToolbox

/**
 * @class JavaScriptLocale
 * @super JavaScriptClass
 * @since 0.1.0
 */
open class JavaScriptLocale: JavaScriptClass {

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	public required init(context: JavaScriptContext) {
		super.init(context: context)
		self.language.reset(Locale.current.languageCode ?? "Unknown")
		self.region.reset(Locale.current.regionCode ?? "Unknown")
		self.ltr.reset(UIApplication.shared.userInterfaceLayoutDirection == .leftToRight)
		self.rtl.reset(UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft)
	}

	//--------------------------------------------------------------------------
	// MARK: JS Properties
	//--------------------------------------------------------------------------

	/**
	 * @property language
	 * @since 0.1.0
	 * @hidden
	 */
	open lazy var language = JavaScriptProperty()

	/**
	 * @property region
	 * @since 0.1.0
	 * @hidden
	 */
	open lazy var region = JavaScriptProperty()

	/**
	 * @property ltr
	 * @since 0.1.0
	 * @hidden
	 */
	open lazy var ltr = JavaScriptProperty()

	/**
	 * @property ltr
	 * @since 0.1.0
	 * @hidden
	 */
	open lazy var rtl = JavaScriptProperty()

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_language
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_language(callback: JavaScriptGetterCallback) {
		callback.returns(self.language)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_region
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_region(callback: JavaScriptGetterCallback) {
		callback.returns(self.region)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_ltr
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_ltr(callback: JavaScriptGetterCallback) {
		callback.returns(self.ltr)
	}

	//--------------------------------------------------------------------------

	/**
	 * @method jsGet_rtl
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsGet_rtl(callback: JavaScriptGetterCallback) {
		callback.returns(self.rtl)
	}
}
