import UIKit

/**
 * @class TransitionManager
 * @since 0.1.0
 */
public final class TransitionManager {

	//--------------------------------------------------------------------------
	// MARK: Types
	//--------------------------------------------------------------------------

	/**
	 * @type Callback
	 * @since 0.1.0
	 */
	public typealias Callback = (() -> Void)

	//--------------------------------------------------------------------------
	// MARK: Static
	//--------------------------------------------------------------------------

	/**
	 * The current transition.
	 * @property transition
	 * @since 0.1.0
	 */
	public static var transition: Transition? {
		return TransitionManager.transitions.last
	}

	/**
	 * Begins a new transition.
	 * @method begin
	 * @since 0.1.0
	 */
	public static func begin(duration: CFTimeInterval, equation: CAMediaTimingFunction, delay: CFTimeInterval, callback: @escaping Callback) {

		Synchronizer.main.execute()

		let transition = Transition()
		transition.begin()
		transition.delay = delay
		transition.duration = duration
		transition.equation = equation
		transition.callback = {
			transition.callback = nil
			transition.finished()
			transition.reset()
			callback()
		}

		transitions.append(transition)
	}

	/**
	 * Commits the current transition.
	 * @method commit
	 * @since 0.1.0
	 */
	public static func commit() {

		guard let transition = transition else {
			return
		}

		Synchronizer.main.execute()

		transition.commit()

		transitions.removeLast()
	}

	//--------------------------------------------------------------------------
	// MARK: Private API
	//--------------------------------------------------------------------------

	/**
	 * @property transitions
	 * @since 0.1.0
	 * @hidden
	 */
	private static var transitions: [Transition] = []
}
