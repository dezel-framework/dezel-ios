import UIKit

/**
 * @class JavaScriptWindow
 * @super JavaScriptView
 * @since 0.1.0
 */
open class JavaScriptWindow: JavaScriptView {

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * Removes the window from the controller.
	 * @method remove
	 * @since 0.1.0
	 */
	open func remove() {
		self.wrapper.removeFromSuperview()
	}

	/**
	 * Finds a view at specified coordinates.
	 * @method findViewAt
	 * @since 0.1.0
	 */
	open func findViewAt(x: Double, y: Double, visible: Bool = true, touchable: Bool = true) -> JavaScriptView? {
		return self.findViewAt(point: Point3D(x: x, y: y, z: 0.0), matrix: Transform3D(), visible: visible, touchable: touchable)
	}

	//--------------------------------------------------------------------------
	// JavaScript Functions
	//--------------------------------------------------------------------------

	/**
	 * @method jsFunction_findViewAt
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func jsFunction_findViewAt(callback: JavaScriptFunctionCallback) {

		if (callback.arguments < 2) {
			fatalError("Method JavaScriptWindow.findViewAt() requires 2 arguments.")
		}

		let x = callback.argument(0).number
		let y = callback.argument(1).number

		if let view = self.findViewAt(point: Point3D(x: x, y: y, z: 0.0), matrix: Transform3D()) {
			callback.returns(view)
		}
	}
}
