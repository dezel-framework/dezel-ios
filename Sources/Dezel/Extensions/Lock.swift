/**
 * @function isLocked
 * @since 0.1.0
 */
func isLocked(_ lock: AnyObject?, key: AnyObject?) -> Bool {

	if (lock == nil) {
		return false
	}

	return lock !== key
}
