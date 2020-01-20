import Foundation
import QuartzCore

/**
 * @extension CAShapeLayer
 * @since 0.1.0
 */
internal extension CAShapeLayer {

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	convenience init(path: CGPath) {
		self.init()
		self.path = path
	}
}
