import UIKit
import LibCache

/**
 * @class ImageDiskCache
 * @since 0.1.0
 * @hidden
 */
open class ImageDiskCache {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * @property cache
	 * @since 0.1.0
	 */
	private var cache: LRUDiskCache = LRUDiskCache(name: "dezel_cache")

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * Assigns an image to the cache.
	 * @method set
	 * @since 0.1.0
	 */
	open func set(_ uri: String, data: UIImage) {
		if let d = data.pngData() {
			self.cache.setData(d, forKey: uri)
		}
	}

	/**
	 * Returns an image from the cacne.
	 * @method get
	 * @since 0.1.0
	 */
	open func get(_ uri: String) -> UIImage? {

		if let data = self.cache.data(forKey: uri) {
			return UIImage(data: data)
		}

		return nil
	}

	/**
	 * Whether an image is cached.
	 * @method has
	 * @since 0.1.0
	 */
	open func has(_ uri: String) -> Bool {
		return self.cache.containsData(forKey: uri)
	}
}
