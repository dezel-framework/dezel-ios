import JavaScriptCore
import DezelCoreJS

/**
 * @class JavaScriptCallback
 * @super NSObject
 * @since 0.1.0
 */
open class JavaScriptCallback: NSObject {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The callback's context.
	 * @property context
	 * @since 0.1.0
	 */
	private(set) public var context: JavaScriptContext

	/**
	 * The callback's target.
	 * @property target
	 * @since 0.1.0
	 */
	private(set) public lazy var target: JavaScriptValue = {
		return JavaScriptValue.create(self.context, handle: self.callbackTarget, protect: false)
	}()

	/**
	 * The callback's callee.
	 * @property callee
	 * @since 0.1.0
	 */
	private(set) public lazy var callee: JavaScriptValue = {
		return JavaScriptValue.create(self.context, handle: self.callbackCallee, protect: false)
	}()

	/**
	 * The callback's argument count.
	 * @property arguments
	 * @since 0.1.0
	 */
	private(set) public var arguments: Int

	/**
	 * @property argc
	 * @since 0.1.0
	 * @hidden
	 */
	private(set) internal var argc: Int

	/**
	 * @property argv
	 * @since 0.1.0
	 * @hidden
	 */
	private(set) internal var argv: UnsafePointer<JSValueRef?>

	/**
	 * @property result
	 * @since 0.1.0
	 * @hidden
	 */
	private(set) internal var result: JSValueRef?

	/**
	 * @property callbackTarget
	 * @since 0.1.0
	 * @hidden
	 */
	private var callbackTarget: JSObjectRef

	/**
	 * @property callbackCallee
	 * @since 0.1.0
	 * @hidden
	 */
	private var callbackCallee: JSObjectRef

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
     * @constructor
     * @since 0.1.0
	 * @hidden
     */
	public init(context: JavaScriptContext, target: JSObjectRef, callee: JSObjectRef, argc: Int, argv: UnsafePointer<JSValueRef?>) {

		self.context = context

		self.callbackTarget = target
		self.callbackCallee = callee
		self.arguments = argc

		self.argc = argc
		self.argv = argv
	}

	/**
	 * Defines the callback's return value.
	 * @method returns
	 * @since 0.1.0
	 */
	final public func returns(_ value: JavaScriptValue?) {
		self.result = toJs(value, in: self.context)
	}

	/**
	 * Defines the callback's return value.
	 * @method returns
	 * @since 0.1.0
	 */
	final public func returns(_ property: JavaScriptProperty) {
		self.result = toJs(property, in: self.context)
	}

	/**
	 * Defines the callback's return value.
	 * @method returns
	 * @since 0.1.0
	 */
	final public func returns(_ value: String) {
		self.result = JavaScriptValueCreateString(self.context.handle, value)
	}

	/**
	 * Defines the callback's return value.
	 * @method returns
	 * @since 0.1.0
	 */
	final public func returns(_ value: Double) {
		self.result = JavaScriptValueCreateNumber(self.context.handle, value)
	}

	/**
	 * Defines the callback's return value.
	 * @method returns
	 * @since 0.1.0
	 */
	final public func returns(_ value: Float) {
		self.result = JavaScriptValueCreateNumber(self.context.handle, Double(value))
	}

	/**
	 * Defines the callback's return value.
	 * @method returns
	 * @since 0.1.0
	 */
	final public func returns(_ value: Int) {
		self.result = JavaScriptValueCreateNumber(self.context.handle, Double(value))
	}

	/**
	 * Defines the callback's return value.
	 * @method returns
	 * @since 0.1.0
	 */
	final public func returns(_ value: Bool) {
		self.result = JavaScriptValueCreateBoolean(self.context.handle, value)
	}
}
