import UIKit

/**
 * @class Synchronizer
 * @since 0.1.0
 */
public class Synchronizer {

	//--------------------------------------------------------------------------
	// MARK: Static
	//--------------------------------------------------------------------------

	/**
	 * The main synchronizer.
	 * @property main
	 * @sine 0.1.0
	 */
	public static let main: Synchronizer = Synchronizer()

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * @property scheduled
	 * @since 0.1.0
	 * @hidden
	 */
	private var scheduled: Bool = false

	/**
	 * @property callbacks
	 * @since 0.1.0
	 * @hidden
	 */
	private var callbacks: [WeakCallback] = []

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
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	public init() {
		self.displayLink = CADisplayLink(target: self, selector: #selector(handleDisplayLink))
		self.displayLink.setup()
		self.displayLink.isPaused = true
	}

	/**
	 * Schedule a callback on the next screen refresh.
	 * @method schedule
	 * @since 0.1.0
	 */
	public func schedule(_ callback: SynchronizerCallback) {

		if (self.scheduled == false) {
			self.scheduled = true
			self.displayLink.isPaused = false
		}

		self.callbacks.append(WeakCallback(ref: callback))
	}

	/**
	 * Executes all the scheduled callbacks.
	 * @method execute
	 * @since 0.1.0
	 */
	public func execute() {

		if (self.scheduled == false) {
			return
		}

		var index = 0

		/*
		 * A dispatch call might invalidate another view that needs its display
		 * updated on this pass therefore we must loop through this way. It might
		 * be a good idea to look for infinite loop in the future.
		 */

		while (index < self.callbacks.count) {

			if let callback = self.callbacks[index].ref {
				callback.performUpdate()
			}

			index += 1
		}

		self.callbacks = []
		self.scheduled = false
	}

	/**
	 * Resets the synchronizer.
	 * @method reset
	 * @since 0.1.0
	 */
	public func reset() {
		self.callbacks = []
		self.scheduled = false
	}

	//--------------------------------------------------------------------------
	// MARK: Private API
	//--------------------------------------------------------------------------

	/**
	 * @method handleDisplayLink
	 * @since 0.1.0
	 * @hidden
	 */
	@objc private func handleDisplayLink() {

		#if DEBUG
			let t1 = CFAbsoluteTimeGetCurrent()
		#endif

		self.execute()

		#if DEBUG
			let t2 = CFAbsoluteTimeGetCurrent()
			let tt = (t2 - t1) * 1000
			NSLog("Synchronizer - Update took \(tt) ms ")
		#endif

		self.displayLink.isPaused = true
	}

	//--------------------------------------------------------------------------
	// MARK: Classes
	//--------------------------------------------------------------------------

	/**
	 * @class WeakCallback
	 * @since 0.1.0
	 * @hidden
	 */
	private class WeakCallback {

		/**
		 * @property ref
		 * @since 0.1.0
		 * @hidden
		 */
		private(set) public weak var ref: SynchronizerCallback?

		/**
		 * @constructor
		 * @since 0.1.0
		 * @hidden
		 */
		public init(ref: SynchronizerCallback?) {
			self.ref = ref
		}
	}
}
