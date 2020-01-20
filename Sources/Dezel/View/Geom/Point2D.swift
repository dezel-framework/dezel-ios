import UIKit

/**
 * @class Point2D
 * @since 0.1.0
 */
public class Point2D {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The point's value on the x axis.
	 * @property x
	 * @since 0.1.0
	 */
	public var x: Double = 0

	/**
	 * The point's value on the y axis.
	 * @property y
	 * @since 0.1.0
	 */
	public var y: Double = 0

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * Initializes the point.
	 * @constructor
	 * @since 0.1.0
	 */
	public init(x: Double, y: Double) {
		self.x = x
		self.y = y
	}

	/**
	 * Rounds the point.
	 * @method round
	 * @since 0.1.0
	 */
	public func round() {
		self.x.round()
		self.y.round()
	}

	/**
	 * Floors the point.
	 * @method floor
	 * @since 0.1.0
	 */
	public func floor() {
		self.x.round(.down)
		self.y.round(.down)
	}

	/**
	 * Ceils the point.
	 * @method ceil
	 * @since 0.1.0
	 */
	public func ceil() {
		self.x.round(.up)
		self.y.round(.up)
	}
}
