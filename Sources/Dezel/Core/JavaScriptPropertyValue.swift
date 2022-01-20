import JavaScriptCore
import DezelCoreJS

/**
 * @class JavaScriptPropertyValue
 * @since 0.1.0
 * @hidden
 */
open class JavaScriptPropertyValue {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The property value's type.
	 * @property type
	 * @since 0.1.0
	 */
	private(set) public var type: JavaScriptPropertyType

	/**
	 * The property value's unit.
	 * @property unit
	 * @since 0.1.0
	 */
	private(set) public var unit: JavaScriptPropertyUnit

	/**
	 * The property value's value.
	 * @property value
	 * @since 0.1.0
	 */
	public var value: JavaScriptValue?

	/**
	 * The property value's string value.
	 * @property string
	 * @since 0.1.0
	 */
	public lazy var string: String = {
		return self.toString()
	}()

	/**
	 * The property value's number value.
	 * @property number
	 * @since 0.1.0
	 */
	public lazy var number: Double = {
		return self.toNumber()
	}()

	/**
	 * The property value's boolean value.
	 * @property boolean
	 * @since 0.1.0
	 */
	public lazy var boolean: Bool = {
		return self.toBoolean()
	}()

	/**
	 * Whether the property value is null.
	 * @property isNull
	 * @since 0.1.0
	 */
	public var isNull: Bool {
		return self.type == .null
	}

	/**
	 * Whether the property value is a string.
	 * @property isString
	 * @since 0.1.0
	 */
	public var isString: Bool {
		return self.type == .string
	}

	/**
	 * Whether the property value is a number.
	 * @property isNumber
	 * @since 0.1.0
	 */
	public var isNumber: Bool {
		return self.type == .number
	}

	/**
	 * Whether the property value is a boolean.
	 * @property isBoolean
	 * @since 0.1.0
	 */
	public var isBoolean: Bool {
		return self.type == .boolean
	}

	/**
	 * Whether the property value is an object.
	 * @property isObject
	 * @since 0.1.0
	 */
	public var isObject: Bool {
		return self.type == .object
	}

	/**
	 * Whether the property value is an array.
	 * @property isArray
	 * @since 0.1.0
	 */
	public var isArray: Bool {
		return self.type == .array
	}

	/**
	 * Whether the property value is a callback.
	 * @property isCallback
	 * @since 0.1.0
	 */
	public var isCallback: Bool {
		return self.type == .callback
	}

	/**
	 * Whether the property value is a variable.
	 * @property isVariable
	 * @since 0.1.0
	 */
	public var isVariable: Bool {
		return self.type == .variable
	}

	/**
	 * Whether the property value is a function.
	 * @property isFunction
	 * @since 0.1.0
	 */
	public var isFunction: Bool {
		return self.type == .function
	}

	/**
	 * Whether the property value is a composite.
	 * @property isComposite
	 * @since 0.1.0
	 */
	public var isComposite: Bool {
		return self.type == .composite
	}

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	public init(type: JavaScriptPropertyType = .null, unit: JavaScriptPropertyUnit = .none, value: JavaScriptValue? = nil) {

		self.type = type
		self.unit = unit

		/*
		 * The data parameter is the JavaScript value given initialy. It's
		 * useful to keep a reference instead of recreating a JavaScript value
		 * from the primitive values.
		 */

		self.value = value
	}

	/**
	 * Resets the property value.
	 * @method reset
	 * @since 0.1.0
	 */
	open func reset(_ value: JavaScriptValue?) {
		self.value = value
	}

	/**
	 * Converts the property value to a string.
	 * @method toString
	 * @since 0.1.0
	 */
	open func toString() -> String {
		return ""
	}

	/**
	 * Converts the property value to a number.
	 * @method toNumber
	 * @since 0.1.0
	 */
	open func toNumber() -> Double {
		return 0.0
	}

	/**
	 * Converts the property value to a boolean.
	 * @method toBoolean
	 * @since 0.1.0
	 */
	open func toBoolean() -> Bool {
		return false
	}

	/**
	 * Whether the property value equals a string.
	 * @method equals
	 * @since 0.1.0
	 */
	open func equals(_ value: String) -> Bool {
		return self.type == .string && self.string == value
	}

	/**
	 * Whether the property value equals a number.
	 * @method equals
	 * @since 0.1.0
	 */
	open func equals(_ value: Double) -> Bool {
		return self.type == .number && self.number == value
	}

	/**
	 * Whether the property value equals a number.
	 * @method equals
	 * @since 0.1.0
	 */
	open func equals(_ value: Double, unit: JavaScriptPropertyUnit) -> Bool {
		return self.type == .number && self.unit == unit && self.number == value
	}

	/**
	 * Whether the property value equals a boolean.
	 * @method equals
	 * @since 0.1.0
	 */
	open func equals(_ value: Bool) -> Bool {
		return self.type == .boolean && self.boolean == value
	}

	/**
	 * Whether the property value equals a value.
	 * @method equals
	 * @since 0.1.0
	 */
	open func equals(_ value: JavaScriptValue) -> Bool {
		return self.value?.equals(value) ?? false
	}

	/**
	 * Casts the property value to a specified type.
	 * @method cast
	 * @since 0.1.0
	 */
	open func cast<T>(_ type: T.Type) -> T? {
		return self.value?.cast(type)
	}

	//--------------------------------------------------------------------------
	// MARK: Internal API
	//--------------------------------------------------------------------------

	/**
	 * @method toHandle
	 * @since 0.1.0
	 * @hidden
	 */
	internal func toHandle(_ context: JavaScriptContext) -> JSValueRef? {

		if let value = self.value {
			return value.toHandle(context)
		}
		
		if (self.type == .composite) {
			
			/*
			 * When attempting to return a composite value, we must create
			 * a string that contains all his components.
			 */
			
			if let composite = self as? JavaScriptPropertyCompositeValue {
				
				var result: String = ""
				
				for component in composite.values {
					result.append(component.string)
					result.append(" ")
				}

				result = result.trim()
				
				self.value = context.createString(result)
			}
			
		} else {
		
			if (self.unit == .none) {

				switch (self.type) {

					case .null:
						self.value = context.Null
					case .string:
						self.value = context.createString(self.string)
					case .number:
						self.value = context.createNumber(self.number)
					case .boolean:
						self.value = context.createBoolean(self.boolean)

					default:
						break
				}

			} else {

				self.value = context.createString(self.string)

			}
		}

		return self.value?.toHandle(context)
	}
}
