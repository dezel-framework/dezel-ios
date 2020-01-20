import JavaScriptCore
import DezelCoreJS

/**
 * @class JavaScriptPropertyCompositeValue
 * @super JavaScriptPropertyValue
 * @since 0.1.0
 * @hidden
 */
open class JavaScriptPropertyCompositeValue: JavaScriptPropertyValue {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The composite's values.
	 * @property values
	 * @since 0.1.0
	 */
	private(set) public var values: [JavaScriptPropertyValue]

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	public init(values: [JavaScriptPropertyValue]) {
		self.values = values
		super.init(type: .composite)
	}

	/**
	 * @inherited
	 * @method toString
	 * @since 0.1.0
	 */
	override open func toString() -> String {
		fatalError("JavaScriptPropertyCompositeValue is not convertible to type string.")
	}

	/**
	 * @inherited
	 * @method toNumber
	 * @since 0.1.0
	 */
	override open func toNumber() -> Double {
		fatalError("JavaScriptPropertyCompositeValue is not convertible to type number.")
	}

	/**
	 * @inherited
	 * @method toBoolean
	 * @since 0.1.0
	 */
	override open func toBoolean() -> Bool {
		fatalError("JavaScriptPropertyFunctionValue is not convertible to type number.")
	}
}
