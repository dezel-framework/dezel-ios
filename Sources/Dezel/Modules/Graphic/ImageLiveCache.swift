import UIKit

/**
 * @class ImageLiveCache
 * @since 0.1.0
 * @hidden
 */
open class ImageLiveCache {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * @property cache
	 * @since 0.1.0
	 * @hidden
	 */
	private var cache: NSCache = NSCache<NSString, UIImage>()

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * Assigns an image to the cache.
	 * @method set
	 * @since 0.1.0
	 */
	open func set(_ uri: String, data: UIImage) {
		self.cache.setObject(data, forKey: uri as NSString)
	}

	/**
	 * Returns an image from the cacne.
	 * @method get
	 * @since 0.1.0
	 */
	open func get(_ uri: String) -> UIImage? {
		return self.cache.object(forKey: uri as NSString)
	}

	/**
	 * Whether an image is cached.
	 * @method has
	 * @since 0.1.0
	 */
	open func has(_ uri: String) -> Bool {
		return self.get(uri) != nil
	}
}
