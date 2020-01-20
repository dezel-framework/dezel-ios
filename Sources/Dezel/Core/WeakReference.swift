import Foundation

/**
 * @class WeakReference
 * @since 0.1.0
 */
public class WeakReference<T: NSObject> {

	/**
	 * The referenced value.
	 * @property value
	 * @since 0.1.0
	 */
	private(set) public weak var value: T?

	/**
	 * Initializes the reference.
	 * @constructor
	 * @since 0.1.0
	 */
	public init(value: T?) {
		self.value = value
	}
}
