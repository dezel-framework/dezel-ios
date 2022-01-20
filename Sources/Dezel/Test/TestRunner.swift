import Foundation
import UIKit

/**
 * @class TestRunner
 * @since 0.1.0
 * @hidden
 */
open class TestRunner: ApplicationController {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * @property complete
	 * @since 0.1.0
	 */
	public var complete: (() -> Void)?

	/**
	 * @property successCount
	 * @since 0.1.0
	 */
	private(set) public var successCount: Int = 0
	
	/**
	 * @property failureCount
	 * @since 0.1.0
	 */
	private(set) public var failureCount: Int = 0
	
	/**
	 * @property host
	 * @since 0.1.0
	 * @hidden
	 */
	private var host: String!

	/**
	 * @property port
	 * @since 0.1.0
	 * @hidden
	 */
	private var port: String!
	
	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @method start
	 * @since 0.1.0
	 */
	open func start(host: String, port: String) {
				
		self.host = host
		self.port = port

		self.view.isOpaque = true // also call viewDidLoad

		self.context.global.property("_TEST_", boolean: true)
		
		self.context.global.property("KARMA_HOST", string: self.host)
		self.context.global.property("KARMA_PORT", string: self.port)
		
		self.context.global.property("DEVICE_ID", string: self.getDeviceId())
		self.context.global.property("DEVICE_PLATFORM_NAME", string: self.getDevicePlatformName())
		self.context.global.property("DEVICE_PLATFORM_VERSION", string: self.getDevicePlatformVersion())

		context.global.defineProperty("__testRunnerResult__", value: context.createFunction(self.testRunnerResult))
		context.global.defineProperty("__testRunnerComplete__", value: context.createFunction(self.testRunnerComplete))
		
		do {
			self.context.evaluate(try String(contentsOfFile: Bundle.module.path(forResource: "TestRunner.js", ofType: nil)!), url: "TestRunner.js")
		} catch {
			fatalError()
		}
	}
	
	//--------------------------------------------------------------------------
	// MARK: API Events
	//--------------------------------------------------------------------------
	
	/**
	 * @property testRunnerResult
	 * @since 0.1.0
	 * @hidden
	 */
	private func testRunnerResult(callback: JavaScriptFunctionCallback) {
		
		let result = callback.argument(0)
				
		let pending = result.property("pending").boolean
		let skipped = result.property("skipped").boolean
		let success = result.property("success").boolean
		
		if (pending ||
			skipped) {
			return
		}
			
		if (success) {
			self.successCount += 1
		} else {
			self.failureCount += 1
		}
	}
	
	/**
	 * @property testRunnerComplete
	 * @since 0.1.0
	 * @hidden
	 */
	private func testRunnerComplete(callback: JavaScriptFunctionCallback) {
		self.complete?()
	}
	
	//--------------------------------------------------------------------------
	// MARK: Private API
	//--------------------------------------------------------------------------
	
	/**
	 * @method getDeviceId
	 * @since 0.1.0
	 * @hidden
	 */
	private func getDeviceId() -> String {
		
		var uuid = UserDefaults.standard.string(forKey: "dezel.device.uuid")
		if (uuid == nil) {
			uuid = UUID().uuidString
			UserDefaults.standard.set(uuid, forKey: "dezel.device.uuid")
		}
		
		return uuid!
	}
	
	/**
	 * @method getDevicePlatformName
	 * @since 0.1.0
	 * @hidden
	 */
	private func getDevicePlatformName() -> String {
		return UIDevice.current.systemName
	}
	
	/**
	 * @method getDevicePlatformVersion
	 * @since 0.1.0
	 * @hidden
	 */
	private func getDevicePlatformVersion() -> String {
		return UIDevice.current.systemVersion
	}
}
