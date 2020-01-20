/**
 * @extension Set
 * @since 0.1.0
 * @hidden
 */
internal extension Set where Element : Hashable {

	/**
	 * @method concat
	 * @since 0.1.0
	 * @hidden
	 */
	mutating func concat(_ other: Set<Element>) {
		for value in other {
			self.insert(value)
		}
	}
}
