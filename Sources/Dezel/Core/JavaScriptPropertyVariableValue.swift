import JavaScriptCore
import DezelCoreJS

/**
 * @class JavaScriptPropertyVariableValue
 * @super JavaScriptPropertyValue
 * @since 0.1.0
 * @hidden
 */
open class JavaScriptPropertyVariableValue: JavaScriptPropertyValue {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The variable's name.
	 * @property name
	 * @since 0.1.0
	 */
	private(set) public var name: String

	/**
	 * The variable's value.
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
	public init(name: String, values: [JavaScriptPropertyValue]) {
		self.name = name
		self.values = values
		super.init(type: .variable)
	}

	/**
	 * @inherited
	 * @method toString
	 * @since 0.1.0
	 */
	override open func toString() -> String {
		fatalError("JavaScriptPropertyVariableValue is not convertible to type string.")
	}

	/**
	 * @inherited
	 * @method toNumber
	 * @since 0.1.0
	 */
	override open func toNumber() -> Double {
		fatalError("JavaScriptPropertyVariableValue is not convertible to type number.")
	}

	/**
	 * @inherited
	 * @method toBoolean
	 * @since 0.1.0
	 */
	override open func toBoolean() -> Bool {
		fatalError("JavaScriptPropertyVariableValue is not convertible to type boolean.")
	}
}
