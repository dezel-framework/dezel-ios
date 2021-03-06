import UIKit

/**
 * @class JavaScriptGlobalModule
 * @super JavaScriptModule
 * @since 0.1.0
 */
open class JavaScriptGlobalModule : JavaScriptModule {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * @property scheduledTimers
	 * @since 0.1.0
	 * @hidden
	 */
	private var scheduledTimers: [Double: ScheduledTimer] = [:]

	/**
 	 * @property scheduledFrames
	 * @since 0.1.0
	 * @hidden
	 */
	private var scheduledFrames: [Double: ScheduledFrame] = [:]

	/**
	 * @property scheduledTimersTotal
	 * @since 0.1.0
	 * @hidden
	 */
	private var scheduledTimersTotal: Double = 0

	/**
	 * @property scheduledFramesTotal
	 * @since 0.1.0
	 * @hidden
	 */
	private var scheduledFramesTotal: Double = 0

	/**
	 * @property listeners
	 * @since 0.1.0
	 * @hidden
	 */
	private var listeners: [String: [JavaScriptValue]] = [:]

	/**
	 * @property displayLink
	 * @since 0.1.0
	 * @hidden
	 */
	private var displayLink: CADisplayLink!

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

    /**
	 * @inherited
     * @constructor
     * @since 0.1.0
     */
	public override init() {

		super.init()

		self.displayLink = CADisplayLink(target: self, selector: #selector(handleDisplayLinkCallback))
		self.displayLink.setup()
		self.displayLink.isPaused = true
	}

    /**
	 * @inherited
     * @method configure
     * @since 0.1.0
     */
	override open func configure(context: JavaScriptContext) {

		context.registerClass("dezel.global.WebSocket", with: JavaScriptWebSocket.self)
		context.registerClass("dezel.global.XMLHttpRequest", with: JavaScriptXMLHttpRequest.self)

		context.global.defineProperty("location", value: context.createObject(JavaScriptLocation.self))
		context.global.defineProperty("navigator", value: context.createObject(JavaScriptNavigator.self))

		context.global.defineProperty("setImmediate", value: context.createFunction(self.setImmediate))
		context.global.defineProperty("setInterval", value: context.createFunction(self.setInterval))
		context.global.defineProperty("setTimeout", value: context.createFunction(self.setTimeout))
		context.global.defineProperty("clearImmediate", value: context.createFunction(self.clearImmediate))
		context.global.defineProperty("clearInterval", value: context.createFunction(self.clearInterval))
		context.global.defineProperty("clearTimeout", value: context.createFunction(self.clearTimeout))
		context.global.defineProperty("requestAnimationFrame", value: context.createFunction(self.requestAnimationFrame))
		context.global.defineProperty("cancelAnimationFrame", value: context.createFunction(self.cancelAnimationFrame))
		context.global.defineProperty("addEventListener", value: context.createFunction(self.addEventListener))
		context.global.defineProperty("removeEventListener", value: context.createFunction(self.removeEventListener))
		context.global.defineProperty("dispatchEvent", value: context.createFunction(self.dispatchEvent))
		context.global.defineProperty("postMessage", value: context.createFunction(self.postMessage))
	}

    /**
	 * @inherited
     * @method reset
     * @since 0.1.0
     */
	open override func willReload(context: JavaScriptContext) {

		let event = context.createEmptyObject()
		event.property("type", string: "beforeunload")
		self.dispatchEvent("beforeunload", event: event)

		self.scheduledTimers.forEach { $0.value.cancel() }
		self.scheduledFrames.forEach { $0.value.cancel() }
		self.scheduledTimers.removeAll()
		self.scheduledFrames.removeAll()
		self.listeners.removeAll()

		JavaScriptWebSocket.reset()
	}

	//--------------------------------------------------------------------------
	// MARK: Function Callbacks
	//--------------------------------------------------------------------------

	/**
	 * @method setImmediate
	 * @since 0.1.0
	 * @hidden
	 */
	private func setImmediate(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 1) {
			fatalError("Function setImmediate() requires 1 argument.")
		}

		callback.returns(self.scheduleTimeout(callback: callback.argument(0), interval: 0))
	}

	/**
	 * @method setInterval
	 * @since 0.1.0
	 * @hidden
	 */
	private func setInterval(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 1) {
			fatalError("Function setInterval() requires at least 1 argument.")
		}

		if (callback.arguments == 1) {
			callback.returns(self.scheduleInterval(callback: callback.argument(0), interval: 10.0))
			return
		}

		if (callback.arguments == 2) {

			let function = callback.argument(0)
			let interval = callback.argument(1).number

			callback.returns(self.scheduleInterval(callback: function, interval: max(10.0, interval)))

			return
		}
	}

	/**
	 * @method setTimeout
	 * @since 0.1.0
	 * @hidden
	 */
	private func setTimeout(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 1) {
			fatalError("Function setTimeout() requires at least 1 argument.")
		}

		if (callback.arguments == 1) {
			callback.returns(self.scheduleTimeout(callback: callback.argument(0), interval: 0))
			return
		}

		if (callback.arguments == 2) {
			callback.returns(self.scheduleTimeout(callback: callback.argument(0), interval: callback.argument(1).number))
			return
		}
	}

	/**
	 * @method clearImmediate
	 * @since 0.1.0
	 * @hidden
	 */
	private func clearImmediate(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 1) {
			fatalError("Function clearImmediate() requires 1 argument.")
		}

		self.removeTimer(callback.argument(0).number)
	}

	/**
	 * @method clearTimeout
	 * @since 0.1.0
	 * @hidden
	 */
	private func clearTimeout(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 1) {
			fatalError("Function clearInterval() requires 1 argument.")
		}

		self.removeTimer(callback.argument(0).number)
	}

	/**
	 * @method clearInterval
	 * @since 0.1.0
	 * @hidden
	 */
	private func clearInterval(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 1) {
			fatalError("Function clearImmediate() requires 1 argument.")
		}

		self.removeTimer(callback.argument(0).number)
	}

	/**
	 * @method requestAnimationFrame
	 * @since 0.1.0
	 * @hidden
	 */
	private func requestAnimationFrame(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 1) {
			fatalError("Function requestAnimationFrame() requires 1 argument.")
		}

		self.startDisplayLink()

		callback.returns(self.scheduleFrame(callback: callback.argument(0)))
	}

	/**
	 * @method cancelAnimationFrame
	 * @since 0.1.0
	 * @hidden
	 */
	private func cancelAnimationFrame(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 1) {
			fatalError("Function cancelAnimationFrame() requires 1 argument.")
		}

		self.removeFrame(callback.argument(0).number)
	}

	/**
	 * @method addEventListener
	 * @since 0.1.0
	 * @hidden
	 */
	private func addEventListener(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 1) {
			fatalError("Function addEventListener() requires 2 argument.")
		}

		let name = callback.argument(0).string
		let listener = callback.argument(1)

		if (self.listeners[name] == nil) {
			self.listeners[name] = []
		}

		self.listeners[name]?.append(listener)
	}

	/**
	 * @method removeEventListener
	 * @since 0.1.0
	 * @hidden
	 */
	private func removeEventListener(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 1) {
			fatalError("Function addEventListener() requires 2 argument.")
		}

		// todo
	}

	/**
	 * @method dispatchEvent
	 * @since 0.1.0
	 * @hidden
	 */
	private func dispatchEvent(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 1) {
			fatalError("Function dispatchEvent() requires 1 argument.")
		}

		let event = callback.argument(0)

		self.dispatchEvent(event.property("type").string, event: event)
	}

	/**
	 * @method postMessage
	 * @since 0.1.0
	 * @hidden
	 */
	private func postMessage(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 1) {
			fatalError("Function postMessage() requires 1 argument.")
		}

		let event = callback.context.createEmptyObject()
		event.property("type", string: "message")
		event.property("origin", string: "self")
		event.property("data", value: callback.argument(0))
		self.dispatchEvent("message", event: event)
	}

	//--------------------------------------------------------------------------
	// MARK: Handlers
	//--------------------------------------------------------------------------

	/**
	 * @method handleDisplayLinkCallback
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func handleDisplayLinkCallback() {

		let frames = self.scheduledFrames

		self.scheduledFrames = [Double: ScheduledFrame]()

		for (_, frame) in frames {
			frame.execute()
		}

		if (self.scheduledFrames.count == 0) {
			self.pauseDisplayLink()
		}
	}

	//--------------------------------------------------------------------------
	// MARK: Private API
	//--------------------------------------------------------------------------

	/**
	 * @method scheduleInterval
	 * @since 0.1.0
	 * @hidden
	 */
	private func scheduleInterval(callback: JavaScriptValue, interval: TimeInterval) -> Double {
		self.scheduledTimersTotal += 1
		self.scheduledTimers[self.scheduledTimersTotal] = ScheduledTimer(callback: callback, interval: interval, repeated: true, module: self, handle: self.scheduledTimersTotal)
		return self.scheduledTimersTotal
	}

	/**
	 * @method scheduleTimeout
	 * @since 0.1.0
	 * @hidden
	 */
	private func scheduleTimeout(callback: JavaScriptValue, interval: TimeInterval) -> Double {
		self.scheduledTimersTotal += 1
		self.scheduledTimers[self.scheduledTimersTotal] = ScheduledTimer(callback: callback, interval: interval, repeated: false, module: self, handle: self.scheduledTimersTotal)
		return self.scheduledTimersTotal
	}

	/**
	 * @method scheduleFrame
	 * @since 0.1.0
	 * @hidden
	 */
	private func scheduleFrame(callback: JavaScriptValue) -> Double {
		self.scheduledFramesTotal += 1
		self.scheduledFrames[self.scheduledFramesTotal] = ScheduledFrame(callback: callback)
		return self.scheduledFramesTotal
	}

	/**
	 * @method removeTimer
	 * @since 0.1.0
	 * @hidden
	 */
	private func removeTimer(_ identifier: Double) {
		self.scheduledTimers[identifier]?.cancel()
		self.scheduledTimers.removeValue(forKey: identifier)
	}

	/**
	 * @method removeFrame
	 * @since 0.1.0
	 * @hidden
	 */
	private func removeFrame(_ identifier: Double) {
		self.scheduledFrames[identifier]?.cancel()
		self.scheduledFrames.removeValue(forKey: identifier)
	}

	/**
	 * @method startDisplayLink
	 * @since 0.1.0
	 * @hidden
	 */
	private func startDisplayLink() {
		self.displayLink.isPaused = false
	}

	/**
	 * @method pauseDisplayLink
	 * @since 0.1.0
	 * @hidden
	 */
	private func pauseDisplayLink() {
		self.displayLink.isPaused = true
	}

	/**
	 * @method dispatchEvent
	 * @since 0.1.0
	 * @hidden
	 */
	private func dispatchEvent(_ type: String, event: JavaScriptValue) {
		self.listeners[type]?.forEach { value in
			value.call([event], target: nil)
		}
	}

	//--------------------------------------------------------------------------
	// MARK: Classes
	//--------------------------------------------------------------------------

	/**
	 * @struct ScheduledTimer
	 * @since 0.1.0
	 * @hidden
	 */
	private class ScheduledTimer: NSObject {

		/**
		 * @property callback
		 * @since 0.1.0
		 */
		private var callback: JavaScriptValue

		/**
		 * @property interval
		 * @since 0.1.0
		 */
		private var interval: Double

		/**
		 * @property repeated
		 * @since 0.1.0
		 */
		private var repeated: Bool

		/**
		 * @property module
		 * @since 0.1.0
		 */
		private var module: JavaScriptGlobalModule

		/**
		 * @property handle
		 * @since 0.1.0
		 */
		private var handle: Double

		/**
		 * @property timer
		 * @since 0.1.0
		 */
		private var timer: Timer?

		/**
		 * @constructor
		 * @since 0.1.0
		 */
		init(callback: JavaScriptValue, interval: Double, repeated: Bool, module: JavaScriptGlobalModule, handle: Double) {

			self.callback = callback
			self.interval = interval
			self.repeated = repeated
			self.module = module
			self.handle = handle

			self.callback.protect()

			super.init()

			self.timer = Timer.scheduledTimer(timeInterval: (interval / 1000), target: self, selector: #selector(handleTimer), userInfo: nil, repeats: repeated)
		}

		/**
		 * @method execute
		 * @since 0.1.0
		 */
		public func execute() {

			self.callback.call()

			if (self.repeated == false) {
				self.cancel()
				self.remove()
			}
		}

		/**
		 * @method cancel
		 * @since 0.1.0
		 */
		public func cancel() {
			self.callback.unprotect()
			self.timer?.invalidate()
			self.timer = nil
		}

		/**
		 * @method remove
		 * @since 0.1.0
		 */
		public func remove() {
			self.module.scheduledTimers.removeValue(forKey: self.handle)
		}

		/**
		 * @method handleTimer
		 * @since 0.1.0
		 */
		@objc public func handleTimer() {
			self.execute()
		}
	}

	/**
	 * @struct ScheduledFrame
	 * @since 0.1.0
	 * @hidden
	 */
	private class ScheduledFrame: NSObject {

		/**
		 * @property callback
		 * @since 0.1.0
		 */
		private var callback: JavaScriptValue

		/**
		 * @constructor
		 * @since 0.1.0
		 */
		init(callback: JavaScriptValue) {
			self.callback = callback
			self.callback.protect()
		}

		/**
		 * @method invalidate
		 * @since 0.1.0
		 */
		public func execute() {
			self.callback.call()
			self.callback.unprotect()
		}

		/**
		 * @method cancel
		 * @since 0.1.0
		 */
		public func cancel() {
			self.callback.unprotect()
		}
	}
}
