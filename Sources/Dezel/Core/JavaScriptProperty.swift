import JavaScriptCore
import DezelCoreJS
import DezelCoreUI

/**
 * @class JavaScriptProperty
 * @super NSObject
 * @since 0.1.0
 */
public class JavaScriptProperty: NSObject {

	//--------------------------------------------------------------------------
	// MARK: Type Alias
	//--------------------------------------------------------------------------

	/**
	 * The property change handler.
	 * @typealias JavaScriptPropertyChangeHandler
	 * @since 0.1.0
	 */
	public typealias JavaScriptPropertyChangeHandler = (JavaScriptProperty) -> Void

	//--------------------------------------------------------------------------
	// MARK: Static
	//--------------------------------------------------------------------------

	/**
	 * @property Null
	 * @since 0.1.0
	 * @hidden
	 */
	public static let Null: JavaScriptPropertyValue = JavaScriptPropertyValue()

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The property's lock.
	 * @property lock
	 * @since 0.1.0
	 */
	private(set) public var lock: AnyObject?

	/**
	 * The property's type.
	 * @property type
	 * @since 0.1.0
	 */
	public var type: JavaScriptPropertyType {
		return self.currentValue.type
	}

	/**
	 * The property's unit.
	 * @property unit
	 * @since 0.1.0
	 */
	public var unit: JavaScriptPropertyUnit {
		return self.currentValue.unit
	}

	/**
	 * The property's string value.
	 * @property string
	 * @since 0.1.0
	 */
	public var string: String {
		return self.currentValue.string
	}

	/**
	 * The property's number value.
	 * @property number
	 * @since 0.1.0
	 */
	public var number: Double {
		return self.currentValue.number
	}

	/**
	 * The property's boolean value.
	 * @property boolean
	 * @since 0.1.0
	 */
	public var boolean: Bool {
		return self.currentValue.boolean
	}

	/**
	 * The property's value.
	 * @property value
	 * @since 0.1.0
	 */
	public var value: JavaScriptValue? {
		return self.currentValue.value
	}

	/**
	 * The property's variable value.
	 * @property variable
	 * @since 0.1.0
	 */
	public var variable: JavaScriptPropertyVariableValue? {
		return self.currentValue as? JavaScriptPropertyVariableValue
	}

	/**
	 * The property's function value.
	 * @property function
	 * @since 0.1.0
	 */
	public var function: JavaScriptPropertyFunctionValue? {
		return self.currentValue as? JavaScriptPropertyFunctionValue
	}

	/**
	 * The property's composite value.
	 * @property composite
	 * @since 0.1.0
	 */
	public var composite: JavaScriptPropertyCompositeValue? {
		return self.currentValue as? JavaScriptPropertyCompositeValue
	}

	/**
	 * Whether the property is null.
	 * @property isNull
	 * @since 0.1.0
	 */
	public var isNull: Bool {
		return self.currentValue.isNull
	}

	/**
	 * Whether the property is a string.
	 * @property isString
	 * @since 0.1.0
	 */
	public var isString: Bool {
		return self.currentValue.isString
	}

	/**
	 * Whether the property is a number.
	 * @property isNumber
	 * @since 0.1.0
	 */
	public var isNumber: Bool {
		return self.currentValue.isNumber
	}

	/**
	 * Whether the property is a boolean.
	 * @property isBoolean
	 * @since 0.1.0
	 */
	public var isBoolean: Bool {
		return self.currentValue.isBoolean
	}

	/**
	 * Whether the property is an object.
	 * @property isObject
	 * @since 0.1.0
	 */
	public var isObject: Bool {
		return self.currentValue.isObject
	}

	/**
	 * Whether the property is an array.
	 * @property isArray
	 * @since 0.1.0
	 */
	public var isArray: Bool {
		return self.currentValue.isArray
	}

	/**
	 * Whether the property is a callback.
	 * @property isCallback
	 * @since 0.1.0
	 */
	public var isCallback: Bool {
		return self.currentValue.isCallback
	}

	/**
	 * Whether the property is a variable.
	 * @property isVariable
	 * @since 0.1.0
	 */
	public var isVariable: Bool {
		return self.currentValue.isVariable
	}

	/**
	 * Whether the property is a function.
	 * @property isFunction
	 * @since 0.1.0
	 */
	public var isFunction: Bool {
		return self.currentValue.isFunction
	}

	/**
	 * Whether the property is a composite.
	 * @property isComposite
	 * @since 0.1.0
	 */
	public var isComposite: Bool {
		return self.currentValue.isComposite
	}

	/**
	 * @property initialValue
	 * @since 0.1.0
	 * @hidden
	 */
	private var initialValue: JavaScriptPropertyValue

	/**
	 * @property currentValue
	 * @since 0.1.0
	 * @hidden
	 */
	private var currentValue: JavaScriptPropertyValue

	/**
	 * @property handler
	 * @since 0.1.0
	 * @hidden
	 */
	private var handler: JavaScriptPropertyChangeHandler?

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * Initializes the property.
	 * @constructor
	 * @since 0.1.0
	 */
	public init(handler: JavaScriptPropertyChangeHandler? = nil) {
		self.initialValue = JavaScriptProperty.Null
		self.currentValue = JavaScriptProperty.Null
		self.handler = handler
	}

	/**
	 * Initializes the property.
	 * @constructor
	 * @since 0.1.0
	 */
	public init(string: String, handler: JavaScriptPropertyChangeHandler? = nil) {
		self.initialValue = JavaScriptPropertyStringValue(value: string)
		self.currentValue = JavaScriptPropertyStringValue(value: string)
		self.handler = handler
	}

	/**
	 * Initializes the property.
	 * @constructor
	 * @since 0.1.0
	 */
	public init(number: Double, handler: JavaScriptPropertyChangeHandler? = nil) {
		self.initialValue = JavaScriptPropertyNumberValue(value: number)
		self.currentValue = JavaScriptPropertyNumberValue(value: number)
		self.handler = handler
	}

	/**
	 * Initializes the property.
	 * @constructor
	 * @since 0.1.0
	 */
	public init(number: Double, unit: JavaScriptPropertyUnit, handler: JavaScriptPropertyChangeHandler? = nil) {
		self.initialValue = JavaScriptPropertyNumberValue(value: number, unit: unit)
		self.currentValue = JavaScriptPropertyNumberValue(value: number, unit: unit)
		self.handler = handler
	}

	/**
	 * Initializes the property.
	 * @constructor
	 * @since 0.1.0
	 */
	public init(boolean: Bool, handler: JavaScriptPropertyChangeHandler? = nil) {
		self.initialValue = JavaScriptPropertyBooleanValue(value: boolean)
		self.currentValue = JavaScriptPropertyBooleanValue(value: boolean)
		self.handler = handler
	}

	/**
	 * Initializes the property.
	 * @constructor
	 * @since 0.1.0
	 */
	public convenience init(lock: AnyObject, handler: JavaScriptPropertyChangeHandler? = nil) {
		self.init(handler: handler)
		self.lock = lock
	}

	/**
	 * Initializes the property.
	 * @constructor
	 * @since 0.1.0
	 */
	public convenience init(string: String, lock: AnyObject, handler: JavaScriptPropertyChangeHandler? = nil) {
		self.init(string: string, handler: handler)
		self.lock = lock
	}

	/**
	 * Initializes the property.
	 * @constructor
	 * @since 0.1.0
	 */
	public convenience init(number: Double, lock: AnyObject, handler: JavaScriptPropertyChangeHandler? = nil) {
		self.init(number: number, handler: handler)
		self.lock = lock
	}

	/**
	 * Initializes the property.
	 * @constructor
	 * @since 0.1.0
	 */
	public convenience init(number: Double, unit: JavaScriptPropertyUnit, lock: AnyObject, handler: JavaScriptPropertyChangeHandler? = nil) {
		self.init(number: number, unit: unit, handler: handler)
		self.lock = lock
	}

	/**
	 * Initializes the property.
	 * @constructor
	 * @since 0.1.0
	 */
	public convenience init(boolean: Bool, lock: AnyObject, handler: JavaScriptPropertyChangeHandler? = nil) {
		self.init(boolean: boolean, handler: handler)
		self.lock = lock
	}

	/**
	 * Reset the property's value.
	 * @method reset
	 * @since 0.1.0
	 */
	public func reset(lock: AnyObject? = nil, initial: Bool = false) {

		if isLocked(self.lock, key: lock) {
			return
		}

		self.lock = lock

		if (initial) {

			if (self.equals(self.initialValue) == false) {
				self.update(self.initialValue)
				self.change()
			}

		} else {

			if (self.isNull == false) {
				self.update()
				self.change()
			}

		}
	}

	/**
	 * Reset the property's value.
	 * @method reset
	 * @since 0.1.0
	 */
	public func reset(_ value: String, lock: AnyObject? = nil, parse: Bool = false) {

		if isLocked(self.lock, key: lock) {
			return
		}

		self.lock = lock

		if (parse) {
			self.parse(value, lock: lock)
			return
		}

		if (self.equals(value) == false) {
			self.update(value)
			self.change()
		}
	}

	/**
	 * Reset the property's value.
	 * @method reset
	 * @since 0.1.0
	 */
	public func reset(_ value: Double, lock: AnyObject? = nil) {

		if isLocked(self.lock, key: lock) {
			return
		}

		self.lock = lock

		if (self.equals(value) == false) {
			self.update(value)
			self.change()
		}
	}

	/**
	 * Reset the property's value.
	 * @method reset
	 * @since 0.1.0
	 */
	public func reset(_ value: Double, unit: JavaScriptPropertyUnit, lock: AnyObject? = nil) {

		if isLocked(self.lock, key: lock) {
			return
		}

		self.lock = lock

		if (self.equals(value, unit: unit) == false) {
			self.update(value, unit: unit)
			self.change()
		}
	}

	/**
	 * Reset the property's value.
	 * @method reset
	 * @since 0.1.0
	 */
	public func reset(_ value: Bool, lock: AnyObject? = nil) {

		if isLocked(self.lock, key: lock) {
			return
		}

		self.lock = lock

		if (self.equals(value) == false) {
			self.update(value)
			self.change()
		}
	}

	/**
	 * Reset the property's value.
	 * @method reset
	 * @since 0.1.0
	 */
	public func reset(_ value: JavaScriptValue, lock: AnyObject? = nil, parse: Bool = false) {

		if isLocked(self.lock, key: lock) {
			return
		}

		self.lock = lock

		switch (true) {

			case value.isNull:
				self.reset(lock: lock)
			case value.isUndefined:
				self.reset(lock: lock)
			case value.isString:
				self.reset(value.string, lock: lock, parse: parse)
			case value.isNumber:
				self.reset(value.number, lock: lock)
			case value.isBoolean:
				self.reset(value.boolean, lock: lock)

			default:

				if (self.equals(value) == false) {
					self.update(value)
					self.change()
				}

				break
		}

		self.currentValue.reset(value)
	}

	/**
	 * Reset the property's value.
	 * @method reset
	 * @since 0.1.0
	 */
	public func reset(_ value: JavaScriptProperty, lock: AnyObject? = nil) {

		if isLocked(self.lock, key: lock) {
			return
		}

		self.lock = lock

		if (self.equals(value) == false) {
			self.update(value)
			self.change()
		}
	}

	/**
	 * Reset the property's value.
	 * @method reset
	 * @since 0.1.0
	 */
	public func reset(_ value: JavaScriptPropertyValue, lock: AnyObject? = nil) {

		if isLocked(self.lock, key: lock) {
			return
		}

		self.lock = lock

		if (self.equals(value) == false) {
			self.update(value)
			self.change()
		}
	}

	/**
	 * Whether the property is equal to a string.
	 * @method equals
	 * @since 0.1.0
	 */
	public func equals(_ value: String) -> Bool {
		return self.currentValue.equals(value)
	}

	/**
	 * Whether the property is equal to a number.
	 * @method equals
	 * @since 0.1.0
	 */
	public func equals(_ value: Double) -> Bool {
		return self.currentValue.equals(value)
	}

	/**
	 * Whether the property is equal to a number.
	 * @method equals
	 * @since 0.1.0
	 */
	public func equals(_ value: Double, unit: JavaScriptPropertyUnit) -> Bool {
		return self.currentValue.equals(value, unit: unit)
	}

	/**
	 * Whether the property is equal to a boolean.
	 * @method equals
	 * @since 0.1.0
	 */
	public func equals(_ value: Bool) -> Bool {
		return self.currentValue.equals(value)
	}

	/**
	 * Whether the property is equal to a value.
	 * @method equals
	 * @since 0.1.0
	 */
	public func equals(_ value: JavaScriptValue) -> Bool {
		return self.currentValue.equals(value)
	}

	/**
	 * Whether the property is equal to a property.
	 * @method equals
	 * @since 0.1.0
	 */
	internal func equals(_ value: JavaScriptProperty) -> Bool {
		return self.equals(value.currentValue)
	}

	/**
	 * Whether the property is equal to a property value.
	 * @method equals
	 * @since 0.1.0
	 */
	public func equals(_ value: JavaScriptPropertyValue) -> Bool {

		switch (self.type) {

			case .null:
				return value.type == .null
			case .string:
				return value.equals(self.string)
			case .number:
				return value.equals(self.number)
			case .boolean:
				return value.equals(self.boolean)

			default:
				break;
		}

		return self.currentValue === value
	}

	/**
	 * Casts the property to a specified type.
	 * @method cast
	 * @since 0.1.0
	 */
	public func cast<T>(_ type: T.Type) -> T? {
		return self.currentValue.cast(type)
	}

	//--------------------------------------------------------------------------
	// MARK: Internal API
	//--------------------------------------------------------------------------

	/**
	 * @method toHandle
	 * @since 0.1.0
	 * @hidden
	 */
	open func toHandle(_ context: JavaScriptContext) -> JSValueRef? {
		return self.currentValue.toHandle(context)
	}

	//--------------------------------------------------------------------------
	// MARK: Private API
	//--------------------------------------------------------------------------

	/**
	 * @method parse
	 * @since 0.1.0
	 * @hidden
	 */
	private func parse(_ value: String, lock: AnyObject? = nil) {

		guard let values = ValueParse(value) else {
			return
		}

		self.reset(values, lock: lock)

		ValueListDelete(values)
	}

	/**
	 * @method reset
	 * @since 0.1.0
	 * @hidden
	 */
	private func reset(_ value: JavaScriptPropertyVariableValue, lock: AnyObject? = nil) {

		if isLocked(self.lock, key: lock) {
			return
		}

		self.lock = lock

		if (self.equals(value) == false) {
			self.update(value)
			self.change()
		}
	}

	/**
	 * @method reset
	 * @since 0.1.0
	 * @hidden
	 */
	private func reset(_ value: JavaScriptPropertyFunctionValue, lock: AnyObject? = nil) {

		if isLocked(self.lock, key: lock) {
			return
		}

		self.lock = lock

		if (self.equals(value) == false) {
			self.update(value)
			self.change()
		}
	}

	/**
	 * @method reset
	 * @since 0.1.0
	 * @hidden
	 */
	private func reset(_ value: JavaScriptPropertyCompositeValue, lock: AnyObject? = nil) {

		if isLocked(self.lock, key: lock) {
			return
		}

		self.lock = lock

		if (self.equals(value) == false) {
			self.update(value)
			self.change()
		}
	}

	/**
	 * @method equals
	 * @since 0.1.0
	 * @hidden
	 */
	private func equals(_ value: JavaScriptPropertyVariableValue) -> Bool {
		return self.currentValue === value
	}

	/**
	 * @method equals
	 * @since 0.1.0
	 * @hidden
	 */
	private func equals(_ value: JavaScriptPropertyFunctionValue) -> Bool {
		return self.currentValue === value
	}

	/**
	 * @method equals
	 * @since 0.1.0
	 * @hidden
	 */
	private func equals(_ value: JavaScriptPropertyCompositeValue) -> Bool {
		return self.currentValue === value
	}

	/**
	 * @method update
	 * @since 0.1.0
	 * @hidden
	 */
	private func update() {
		self.currentValue = JavaScriptProperty.Null
	}

	/**
	 * @method update
	 * @since 0.1.0
	 * @hidden
	 */
	private func update(_ value: String) {
		self.currentValue = JavaScriptPropertyStringValue(value: value)
	}

	/**
	 * @method update
	 * @since 0.1.0
	 * @hidden
	 */
	private func update(_ value: Double) {
		self.currentValue = JavaScriptPropertyNumberValue(value: value)
	}

	/**
	 * @method update
	 * @since 0.1.0
	 * @hidden
	 */
	private func update(_ value: Double, unit: JavaScriptPropertyUnit) {
		self.currentValue = JavaScriptPropertyNumberValue(value: value, unit: unit)
	}

	/**
	 * @method update
	 * @since 0.1.0
	 * @hidden
	 */
	private func update(_ value: Bool) {
		self.currentValue = JavaScriptPropertyBooleanValue(value: value)
	}

	/**
	 * @method update
	 * @since 0.1.0
	 * @hidden
	 */
	private func update(_ value: JavaScriptValue) {
		self.currentValue = JavaScriptPropertyScriptValue(value: value)
	}

	/**
	 * @method update
	 * @since 0.1.0
	 * @hidden
	 */
	private func update(_ value: JavaScriptProperty) {
		self.currentValue = value.currentValue
	}

	/**
	 * @method update
	 * @since 0.1.0
	 * @hidden
	 */
	private func update(_ value: JavaScriptPropertyValue) {
		self.currentValue = value
	}

	/**
	 * @method update
	 * @since 0.1.0
	 * @hidden
	 */
	private func update(_ value: JavaScriptPropertyVariableValue) {
		self.currentValue = value
	}

	/**
	 * @method update
	 * @since 0.1.0
	 * @hidden
	 */
	private func update(_ value: JavaScriptPropertyFunctionValue) {
		self.currentValue = value
	}

	/**
	 * @method update
	 * @since 0.1.0
	 * @hidden
	 */
	private func update(_ value: JavaScriptPropertyCompositeValue) {
		self.currentValue = value
	}

	/**
	 * @method change
	 * @since 0.1.0
	 * @hidden
	 */
	private func change() {
		self.handler?(self)
	}
}
