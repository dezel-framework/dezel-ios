import UIKit

/**
 * @protocol TouchCancelable
 * @since 0.1.0
 */
public protocol TouchCancelable {

    /**
	 * Cancels the touch event.
     * @method cancelTouchEvent
     * @since 0.1.0
     */
    func cancelTouchEvent(touches: Set<UITouch>, with event: UIEvent)

}
