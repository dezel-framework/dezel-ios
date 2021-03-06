import JavaScriptCore
import DezelCoreJS

/**
 * @class JavaScriptPropertyStringValue
 * @super JavaScriptPropertyValue
 * @since 0.1.0
 * @hidden
 */
open class JavaScriptPropertyStringValue: JavaScriptPropertyValue {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * @property data
	 * @since 0.1.0
	 * @hidden
	 */
	private var data: String

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	public init(value: String) {
		self.data = value
		super.init(type: .string, unit: .none)
	}

	/**
	 * @inherited
	 * @method toString
	 * @since 0.1.0
	 */
	override open func toString() -> String {
		return self.data
	}

	/**
	 * @inherited
	 * @method toNumber
	 * @since 0.1.0
	 */
	override open func toNumber() -> Double {
		return self.data.toNumber()
	}

	/**
	 * @inherited
	 * @method toBoolean
	 * @since 0.1.0
	 */
	override open func toBoolean() -> Bool {
		return self.data.isEmpty == false
	}
}
