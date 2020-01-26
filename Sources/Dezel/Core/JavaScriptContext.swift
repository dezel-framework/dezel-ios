import JavaScriptCore
import DezelCoreJS

/**
 * @class JavaScriptContext
 * @since 0.1.0
 */
open class JavaScriptContext {

	//--------------------------------------------------------------------------
	// MARK: Constants
	//--------------------------------------------------------------------------

	/**
	 * The null value.
	 * @const Null
	 * @since 0.1.0
	 */
	private(set) public lazy var Null: JavaScriptValue = {
		return self.createNull()
	}()

	/**
	 * The undefined value.
	 * @const Undefined
	 * @since 0.1.0
	 */
	private(set) public lazy var Undefined: JavaScriptValue = {
		return self.createUndefined()
	}()

	/**
	 * The true value.
	 * @const True
	 * @since 0.1.0
	 */
	private(set) public lazy var True: JavaScriptValue = {
		return self.createBoolean(true)
	}()

	/**
	 * The false value.
	 * @const False
	 * @since 0.1.0
	 */
	private(set) public lazy var False: JavaScriptValue = {
		return self.createBoolean(false)
	}()

	/**
	 * @const native
	 * @since 0.1.0
	 * @hidden
	 */
	private(set) internal lazy var native: JavaScriptValue = {
		return self.createSymbol("native")
	}()

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The context's handle.
     * @property handle
     * @since 0.1.0
	 */
	private(set) public var handle: JSContextRef!

	/**
	 * The context's global object.
     * @property global
     * @since 0.1.0
	 */
	private(set) public var global: JavaScriptValue!

	/**
	 * The context's bridged classes.
     * @property classes
     * @since 0.1.0
	 */
	internal(set) public var classes: [String: JavaScriptValue] = [:]

	/**
	 * The context's bridged objects.
     * @property objects
     * @since 0.1.0
	 */
	internal(set) public var objects: [String: JavaScriptValue] = [:]

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * Initializes the context.
     * @constructor
     * @since 0.1.0
	 */
	public init() {

		self.handle = JavaScriptContextCreate(Bundle.main.bundleIdentifier ?? "Dezel Context")

		self.global = JavaScriptValue.create(self, handle: JavaScriptContextGetGlobalObject(self.handle))
		self.global.defineProperty("global", value: self.global, getter: nil, setter: nil, writable: false, enumerable: false, configurable: false)
		self.global.defineProperty("window", value: self.global, getter: nil, setter: nil, writable: false, enumerable: false, configurable: false)

		/**
		 * Creates a native symbol that will be used to store native object
		 * on standard object.
		 */

		self.global.defineProperty("$native", value: self.native, getter: nil, setter: nil, writable: false, enumerable: false, configurable: false)
	}

	/**
	 * @destructor
     * @since 0.1.0
	 * @hidden
	 */
	deinit {
		self.dispose()
	}

	/**
	 * Registers multiple bridged context classes.
	 * @method registerClasses
	 * @since 0.1.0
	 */
	open func registerClasses(_ classes: [String: AnyClass]) {
		classes.forEach {
			self.registerClass($0.key, with: $0.value)
		}
	}

	/**
	 * Registers multiple bridged context objects.
	 * @method registerObjects
	 * @since 0.1.0
	 */
	open func registerObjects(_ objects: [String: AnyClass]) {
		objects.forEach {
			self.registerObject($0.key, with: $0.value)
		}
	}

	/**
	 * Registers a bridged context class.
	 * @method registerClass
	 * @since 0.1.0
	 */
	open func registerClass(_ uid: String, with value: AnyClass) {
		self.classes[uid] = self.createClass(value)
	}

	/**
	 * Register a bridged context object.
	 * @method registerObject
	 * @since 0.1.0
	 */
	open func registerObject(_ uid: String, with value: AnyClass) {
		self.objects[uid] = self.createObject(value)
	}

	/**
	 * Disposes the context.
     * @method dispose
     * @since 0.1.0
     */
	open func dispose() {

		self.objects.removeAll()
		self.classes.removeAll()
		self.global.dispose()

		self.garbageCollect()

		JavaScriptContextDelete(self.handle)
	}

	/**
	 * Creates a null JavaScript value in the context.
	 * @method createNull
	 * @since 0.1.0
	 */
	open func createNull() -> JavaScriptValue {
		return JavaScriptValue.createNull(self)
	}

	/**
	 * Creates an undefined JavaScript value in the context.
	 * @method createUndefined
	 * @since 0.1.0
	 */
	open func createUndefined() -> JavaScriptValue {
		return JavaScriptValue.createUndefined(self)
	}

	/**
	 * Creates a string JavaScript value in the context.
	 * @method createString
	 * @since 0.1.0
	 */
	open func createString(_ value: String) -> JavaScriptValue {
		return JavaScriptValue.createString(self, value: value)
	}

	/**
	 * Creates a number JavaScript value in the context.
	 * @method createNumber
	 * @since 0.1.0
	 */
	open func createNumber(_ value: Double) -> JavaScriptValue {
		return JavaScriptValue.createNumber(self, value: value)
	}

	/**
	 * Creates a number JavaScript value in the context.
	 * @method createNumber
	 * @since 0.1.0
	 */
	open func createNumber(_ value: Float) -> JavaScriptValue {
		return JavaScriptValue.createNumber(self, value: Double(value))
	}

	/**
	 * Creates a number JavaScript value in the context.
	 * @method createNumber
	 * @since 0.1.0
	 */
	open func createNumber(_ value: Int) -> JavaScriptValue {
		return JavaScriptValue.createNumber(self, value: Double(value))
	}

	/**
	 * Creates a number JavaScript value in the context.
	 * @method createNumber
	 * @since 0.1.0
	 */
	open func createNumber(_ value: CGFloat) -> JavaScriptValue {
		return JavaScriptValue.createNumber(self, value: Double(value))
	}

	/**
	 * Creates a boolean JavaScript value in the context.
	 * @method createBoolean
	 * @since 0.1.0
	 */
	open func createBoolean(_ value: Bool) -> JavaScriptValue {
		return JavaScriptValue.createBoolean(self, value: value)
	}

	/**
	 * Creates a symbol JavaScript value in the context.
	 * @method createSymbol
	 * @since 0.1.0
	 */
	open func createSymbol(_ value: String) -> JavaScriptValue {
		return JavaScriptValue.createSymbol(self, value: value)
	}

	/**
	 * Creates an empty object in the context.
	 * @method createEmptyObject
	 * @since 0.1.0
	 */
	open func createEmptyObject() -> JavaScriptValue {
		return JavaScriptValue.createEmptyObject(self)
	}

	/**
	 * Creates an empty array in the context.
	 * @method createEmptyArray
	 * @since 0.1.0
	 */
	open func createEmptyArray() -> JavaScriptValue {
		return JavaScriptValue.createEmptyArray(self)
	}

	/**
	 * Creates a function in the context.
	 * @method createFunction
	 * @since 0.1.0
	 */
	open func createFunction(_ handler: @escaping JavaScriptFunctionHandler) -> JavaScriptValue {
		return JavaScriptValue.createFunction(self, handler: handler)
	}

	/**
	 * Creates a function in the context.
	 * @method createFunction
	 * @since 0.1.0
	 */
	open func createFunction(_ name: String, _ handler: @escaping JavaScriptFunctionHandler) -> JavaScriptValue {
		return JavaScriptValue.createFunction(self, handler: handler, name: name)
	}

	/**
	 * Creates a bridged object in the context.
	 * @method createObject
	 * @since 0.1.0
	 */
	open func createObject(_ template: AnyClass) -> JavaScriptValue {
		return JavaScriptValue.createObject(self, template: template)
	}

	/**
	 * Creates a bridged class in the context.
	 * @method createClass
	 * @since 0.1.0
	 */
	open func createClass(_ template: AnyClass) -> JavaScriptValue {
		return JavaScriptValue.createClass(self, template: template)
	}

	/**
	 * Creates a return value.
     * @method createReturnValue
     * @since 0.1.0
	 */
	open func createReturnValue() -> JavaScriptValue {
		return self.createUndefined()
	}

	/**
	 * Evaluates JavaScript code in the context.
	 * @method evaluate
	 * @since 0.1.0
	 */
	open func evaluate(_ source: String) {
		JavaScriptContextEvaluate(self.handle, source, "<none>")
	}

	/**
	 * Evaluates JavaScript code in the context.
     * @method evaluate
     * @since 0.1.0
     */
	open func evaluate(_ source: String, url: String) {
		JavaScriptContextEvaluate(self.handle, source, url)
	}

	/**
	 * Assigns a custom attribute on the context.
	 * @method attribute
	 * @since 0.1.0
	 */
	open func attribute(_ key: AnyObject, value: AnyObject?) {
		let hash = toHash(key)
		JavaScriptContextGetAttribute(self.handle, hash)?.release()
		JavaScriptContextSetAttribute(self.handle, hash, toRetainedOpaque(value))
	}

	/**
	 * Returns a custom attribute from the context.
	 * @method attribute
	 * @since 0.1.0
	 */
	open func attribute(_ key: AnyObject) -> AnyObject? {
		return toUnretainedObject(JavaScriptContextGetAttribute(self.handle, toHash(key)))
	}

	/**
	 * Assigns the context's error handler.
	 * @method handleError
	 * @since 0.1.0
	 */
	open func handleError(handler: @escaping JavaScriptErrorHandler) {
		JavaScriptContextSetExceptionHandler(self.handle, javaScriptContextExceptionCallback)
		JavaScriptContextSetAttribute(self.handle, kExceptionWrapperKey, Unmanaged.passRetained(JavaScriptExceptionWrapper(context: self, handler: handler)).toOpaque())
	}

	/**
	 * Perform a garbage collection on this context.
     * @method garbageCollect
     * @since 0.1.0
     */
	open func garbageCollect() {
		JSGarbageCollect(self.handle)
	}
}

/**
 * The context's error handler.
 * @typealias JavaScriptErrorHandler
 * @since 0.1.0
 */
public typealias JavaScriptErrorHandler = (JavaScriptValue) -> (Void)

/**
 * @extension JavaScriptContext
 * @since 0.1.0
 * @hidden
 */
public extension JavaScriptContext {

	/**
	 * The context's controller.
	 * @property controller
	 * @since 0.1.0
	 */
	var controller: ApplicationController {
		return self.attribute(kApplicationControllerKey) as! ApplicationController
	}

	/**
	 * @method createObject
	 * @since 0.1.0
	 * @hidden
	 */
	func createObject(_ dictionary: [String: String]) -> JavaScriptValue {

		let result = self.createEmptyObject()

		for (key, val) in dictionary {
			result.property(key, value: self.createString(val))
		}

		return result
	}

	/**
	 * @method createObject
	 * @since 0.1.0
	 * @hidden
	 */
	func createObject(_ dictionary: [String: Double]) -> JavaScriptValue {

		let result = self.createEmptyObject()

		for (key, val) in dictionary {
			result.property(key, value: self.createNumber(val))
		}

		return result
	}

	/**
	 * @method createString
	 * @since 0.1.0
	 * @hidden
	 */
	func createString(_ url: URL) -> JavaScriptValue {
		return self.createString(url.absoluteString)
	}
}

/**
 * @function javaScriptContextExceptionCallback
 * @since 0.1.0
 * @hidden
 */
private let javaScriptContextExceptionCallback: @convention(c) (JSContextRef?, JSValueRef?) -> Void = { context, error in

	let error = error!
	let context = context!

	let wrapper = Unmanaged<JavaScriptExceptionWrapper>.fromOpaque(
		JavaScriptContextGetAttribute(context, kExceptionWrapperKey)
	).takeUnretainedValue()

	wrapper.handler(JavaScriptValue.create(wrapper.context, handle: error))
}
