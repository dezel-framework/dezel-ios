import Foundation
import QuartzCore

/**
 * @extension CADisplayLink
 * @since 0.1.0
 */
internal extension CADisplayLink {

	/**
	 * @method setup
	 * @since 0.1.0
	 * @hidden
	 */
	func setup() {
		self.add(to: .main, forMode: .common)
	}
}
