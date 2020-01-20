/**
 * @extension Dictionary
 * @since 0.1.0
 * @hidden
 */
internal extension Dictionary where Value: Equatable  {

	/**
	 * @method keyOf
	 * @since 0.1.0
	 * @hidden
	 */
	func keyOf(_ value: Value) -> Key? {
		return self.first {
			$1 == value
		}?.key
	}
}
