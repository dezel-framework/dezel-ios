import UIKit

/**
 * @class Transition
 * @since 0.1.0
 */
public final class Transition {

	//--------------------------------------------------------------------------
	// MARK: Types
	//--------------------------------------------------------------------------

	/**
	 * The transition callback.
	 * @type Callback
	 * @since 0.1.0
	 */
	public typealias Callback = (() -> Void)

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The transition's callback.
	 * @property callback
	 * @since 0.1.0
	 */
	public var callback: Callback? {
		willSet(value) {
			CATransaction.setCompletionBlock(value)
		}
	}

	/**
	 * The transition's duration.
	 * @property duration
	 * @since 0.1.0
	 */
	public var duration: CFTimeInterval = 0.350 {
		willSet(value) {
			CATransaction.setAnimationDuration(value)
		}
	}

	/**
	 * The transition's equation.
	 * @property equation
	 * @since 0.1.0
	 */
	public var equation: CAMediaTimingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default) {
		willSet(value) {
			CATransaction.setAnimationTimingFunction(value)
		}
	}

	/**
	 * The transition's delay.
	 * @property delay
	 * @since 0.1.0
	 */
	public var delay: CFTimeInterval = 0

	/**
	 * The transition's observers.
	 * @property observers
	 * @since 0.1.0
	 */
	private var observers: [CALayer] = []

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * Begins the transition.
	 * @method begin
	 * @since 0.1.0
	 */
	public func begin() {
		self.dispatchBeginCallback()
		CATransaction.begin()
	}

	/**
	 * Commits the transition.
	 * @method commit
	 * @since 0.1.0
	 */
	public func commit() {
		self.dispatchCommitCallback()
		CATransaction.commit()
	}

	/**
	 * Adds a layer to be notified.
	 * @method notify
	 * @since 0.1.0
	 */
	public func notify(_ layer: CALayer) {
		self.observers.add(layer)
	}

	//--------------------------------------------------------------------------
	// MARK: Internal API
	//--------------------------------------------------------------------------

	/**
	 * @method finished
	 * @since 0.1.0
	 * @hidden
	 */
	internal func finished() {
		self.dispatchFinishCallback()
	}

	/**
	 * @method reset
	 * @since 0.1.0
	 * @hidden
	 */
	internal func reset() {
		self.observers.removeAll()
	}

	//--------------------------------------------------------------------------
	// MARK: Private API
	//--------------------------------------------------------------------------

	/**
	 * @method dispatchBeginCallback
	 * @since 0.1.0
	 * @hidden
	 */
	private func dispatchBeginCallback() {
		self.observers.forEach {
			($0 as? Animatable)?.didBeginTransition(layer: $0)
		}
	}

	/**
	 * @method dispatchCommitCallback
	 * @since 0.1.0
	 * @hidden
	 */
	private func dispatchCommitCallback() {
		self.observers.forEach {
			($0 as? Animatable)?.didCommitTransition(layer: $0)
		}
	}

	/**
	 * @method dispatchFinishCallback
	 * @since 0.1.0
	 * @hidden
	 */
	private func dispatchFinishCallback() {
		self.observers.forEach {
			($0 as? Animatable)?.didFinishTransition(layer: $0)
		}
	}
}
