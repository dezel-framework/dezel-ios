import UIKit

/**
 * @class ApplicationController
 * @super UIViewController
 * @since 0.1.0
 */
open class ApplicationController: UIViewController, StylesheetDelegate {

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * The application controller's sources.
	 * @property sources
	 * @since 0.1.0
	 */
	open var sources: [Source] = []

	/**
	 * The application controller's modules.
	 * @property modules
	 * @since 0.1.0
	 */
	open var modules: [JavaScriptModule] = []

	/**
	 * The application controller's JavaScript context.
	 * @property context
	 * @since 0.1.0
	 */
	private(set) public var context: JavaScriptContext = JavaScriptContext()

	/**
	 * The application controller's display.
	 * @property display
	 * @since 0.1.0
	 */
	private(set) public var display: Display = Display()

	/**
	 * The application controller's stylesheet.
	 * @property stylesheet
	 * @since 0.1.0
	 */
	private(set) public var stylesheet: Stylesheet = Stylesheet()

	/**
	 * The application controller's application.
	 * @property application
	 * @since 0.1.0
	 */
	private(set) public var application: JavaScriptApplication?

	/**
	 * @property loaded
	 * @since 0.1.0
	 * @hidden
	 */
	private var loaded: Bool = false

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @destructor
	 * @since 0.1.0
	 * @hidden
	 */
	deinit {
		self.unregisterObservers()
	}

	/**
	 * Configures the application.
	 * @method configure
	 * @since 0.1.0
	 */
	open func configure() {

	}

	/**
	 * Configures the application's stylesheet.
	 * @method configure
	 * @since 0.1.0
	 */
	open func configure(stylesheet: Stylesheet) {

	}

	/**
	 * Evaluates a script file.
	 * @method evaluate
	 * @since 0.1.0
	 */
	open func evaluate(_ source: String, url: String) {
		self.context.evaluate(source, url: url)
	}

	/**
	 * Registers the application.
	 * @method register
	 * @since 0.1.0
	 */
	open func register(application: JavaScriptApplication) {

		self.application?.destroy()
		self.application = application

		if (self.loaded) {
			self.launch()
		}
	}

	/**
	 * Reloads the application.
	 * @method reload
	 * @since 0.1.0
	 */
	open func reload() {

		self.loaded = false

		for module in self.modules {
			module.willReload(context: self.context)
		}

		self.presentedViewController?.dismiss(animated: false, completion: nil)

		Synchronizer.main.reset()

		self.application?.destroy()
		self.application = nil

		for source in self.sources {
			source.apply(application: self)
		}

		for module in self.modules {
			module.didReload(context: self.context)
		}

		self.launch()

		Synchronizer.main.execute()

		self.loaded = true

		Toast(view: self.view, text: "Reloaded").show()
	}

	/**
	 * Reloads the application's styles.
	 * @method reloadStyles
	 * @since 0.1.0
	 */
	open func reloadStyles() {

		self.stylesheet = Stylesheet()

		self.prepareStylesheet()

		for source in self.sources where source is Styles {
			source.apply(application: self)
		}

		self.display.stylesheet = stylesheet
	}

	//--------------------------------------------------------------------------
	// MARK: Events
	//--------------------------------------------------------------------------

	/**
	 * Called when the application opens a resource URL.
	 * @method didOpenResourceURL
	 * @since 0.1.0
	 */
	open func didOpenResourceURL(_ url: URL) {
		self.application?.callMethod("nativeOnOpenResourceURL", arguments: [self.context.createString(url.absoluteString)])
	}

	/**
	 * Called when the application opens an universal URL.
	 * @method openUniversalURL
	 * @since 0.1.0
	 */
	open func didOpenUniversalURL(_ url: URL) {
		self.application?.callMethod("nativeOnOpenUniversalURL", arguments: [self.context.createString(url.absoluteString)])
	}

	/**
	 * Called when the application enters a background state.
	 * @method didEnterBackground
	 * @since 0.1.0
	 */
	open func didEnterBackground() {
		self.application?.callMethod("nativeOnEnterBackground")
	}

	/**
	 * Called when the application enters a foreground state.
	 * @method didEnterForeground
	 * @since 0.1.0
	 */
	open func didEnterForeground() {
		self.application?.callMethod("nativeOnEnterForeground")
	}

	//--------------------------------------------------------------------------
	// MARK: View Management
	//--------------------------------------------------------------------------

	/**
	 * @inherited
	 * @method loadView
	 * @since 0.1.0
	 */
	override open func loadView() {
		self.view = UIView(frame: UIScreen.main.bounds)
	}

	/**
	 * @inherited
	 * @method viewDidLoad
	 * @since 0.1.0
	 */
	override open func viewDidLoad() {

		self.view.isHidden = false
		self.view.isOpaque = true
		self.view.backgroundColor = UIColor.black

		self.view.addSubview(self.statusBar)

		self.registerObservers()

		self.context.attribute(kApplicationControllerKey, value: self)
		self.context.global.property("_DEV_", boolean: self.isDev())
		self.context.global.property("_SIM_", boolean: self.isSim())

		self.context.handleError { error in

			var file = "<no file>"
			var line = "<no line>"
			var stack = ""

			if (error.isObject) {
				file = error.property("sourceURL").string
				line = error.property("line").string
				stack = error.property("stack").string
			}

			let message =
				"\(error.string) \n " +
				"File: \(file) \n " +
				"Line: \(line) \n " +
				"Stack Trace:  \n " +
				"\(stack)"

			//fatalError(message)
			print(message)
		}

		self.prepareStylesheet()

		self.display.scale = Double(UIScreen.main.scale)
		self.display.viewportWidth = Double(UIScreen.main.bounds.width)
		self.display.viewportHeight = Double(UIScreen.main.bounds.height)
		self.display.stylesheet = self.stylesheet

		self.configure()

		self.modules.append(JavaScriptGlobalModule())
		self.modules.append(JavaScriptPlatformModule())
		self.modules.append(JavaScriptLocaleModule())
		self.modules.append(JavaScriptDeviceModule())
		self.modules.append(JavaScriptDialogModule())
		self.modules.append(JavaScriptGraphicModule())
		self.modules.append(JavaScriptViewModule())
		self.modules.append(JavaScriptFormModule())
		self.modules.append(JavaScriptApplicationModule())

		for module in self.modules {
			module.configure(context: self.context)
		}

		for source in self.sources {
			source.apply(application: self)
		}

		self.loaded = true
        
		self.launch()
	}

	/**
	 * @inherited
	 * @method viewWillLayoutSubviews
	 * @since 0.1.0
	 */
	override open func viewWillLayoutSubviews() {

		let bounds = UIScreen.main.bounds

		self.view.frame = bounds

		self.display.viewportWidth = Double(bounds.width)
		self.display.viewportHeight = Double(bounds.height)

		if let application = self.application {
			application.window.width.reset(Double(bounds.width))
			application.window.height.reset(Double(bounds.height))
		}

		self.statusBar.frame = UIApplication.shared.statusBarFrame
	}

	/**
	 * @inherited
	 * @method viewWillTransition
	 * @since 0.1.0
	 */
	override open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

		super.viewWillTransition(to: size, with: coordinator)

		coordinator.animate(alongsideTransition: { context in

			self.display.viewportWidth = Double(size.width)
			self.display.viewportHeight = Double(size.height)

			let duration = self.getRotationAnimationDuration(context: context)
			let equation = self.getRotationAnimationEquation(context: context)

			TransitionManager.begin(
				duration: duration,
				equation: equation,
				delay: 0
			) { }

			if let application = self.application {
				application.window.width.reset(Double(size.width), unit: .px, lock: self)
				application.window.height.reset(Double(size.height), unit: .px, lock: self)
			}

			TransitionManager.commit()

			self.statusBar.frame = UIApplication.shared.statusBarFrame

		}, completion: nil)
	}

	/**
	 * @inherited
	 * @method didReceiveMemoryWarning
	 * @since 0.1.0
	 */
	open override func didReceiveMemoryWarning() {
		self.application?.callMethod("nativeOnLowMemory")
	}

	//--------------------------------------------------------------------------
	// MARK: Touch Management
	//--------------------------------------------------------------------------

	/**
	 * Convenience method to dispatch a touch cancel event.
	 * @method dispatchTouchCancel
	 * @since 0.1.0
	 */
	open func dispatchTouchCancel(_ touches: Set<UITouch>) {
		self.dispatchTouchEvent("touchcancel", touches: touches)
	}

	/**
	 * Convenience method to dispatch a touch start event.
	 * @method dispatchTouchStart
	 * @since 0.1.0
	 */
	open func dispatchTouchStart(_ touches: Set<UITouch>) {

		for touch in touches {

			let point = touch.location(
				in: self.view
			)

			touch.target = self.application?.window.findViewAt(x: Double(point.x), y: Double(point.y))
		}

		self.dispatchTouchEvent("touchstart", touches: touches)
	}

	/**
	 * Convenience method to dispatch a touch move event.
	 * @method dispatchTouchMove
	 * @since 0.1.0
	 */
	open func dispatchTouchMove(_ touches: Set<UITouch>) {
		self.dispatchTouchEvent("touchmove", touches: touches)
	}

	/**
	 * Convenience method to dispatch a touch end event.
	 * @method dispatchTouchEnd
	 * @since 0.1.0
	 */
	open func dispatchTouchEnd(_ touches: Set<UITouch>) {
		self.dispatchTouchEvent("touchend", touches: touches)
	}

	/**
	 * @method dispatchTouchEvent
	 * @since 0.1.0
	 * @hidden
	 */
	private func dispatchTouchEvent(_ type: String, touches: Set<UITouch>) {

		guard let application = self.application else {
			return
		}

		let array = self.context.createEmptyArray()

		for (i, t) in touches.enumerated() {

			let point = t.location(
				in: self.view
			)

			let touch = self.context.createEmptyObject()

			touch.property("x", number: Double(point.x))
			touch.property("y", number: Double(point.y))
			touch.property("id", number: t.id)
			touch.property("target", value: t.target)
			touch.property("canceled", boolean: t.canceled)
			touch.property("captured", boolean: t.captured)

			array.property(i, value: touch)
		}

		switch (type) {

			case "touchcancel":
				application.callMethod("nativeOnTouchCancel", arguments: [array], result: nil)
			case "touchstart":
				application.callMethod("nativeOnTouchStart", arguments: [array], result: nil)
			case "touchmove":
				application.callMethod("nativeOnTouchMove", arguments: [array], result: nil)
			case "touchend":
				application.callMethod("nativeOnTouchEnd", arguments: [array], result: nil)

			default:
				fatalError()
		}

		for (i, t) in touches.enumerated() {

			let touch = array.property(i)
			t.canceled = touch.property("canceled").boolean
			t.captured = touch.property("captured").boolean

			let receiver = touch.property("receiver")
			if (receiver.isNull ||
				receiver.isUndefined) {
				continue
			}

			if (t.captured &&
				t.receiver == nil) {
				t.receiver = receiver.cast(JavaScriptView.self)
			}
		}
	}

	//--------------------------------------------------------------------------
	// MARK: Keyboard Management
	//--------------------------------------------------------------------------

	/**
	 * @property keyboardVisible
	 * @since 0.1.0
	 * @hidden
	 */
	private var keyboardVisible: Bool = false

	/**
	 * @property keyboardResizing
	 * @since 0.1.0
	 * @hidden
	 */
	private var keyboardResizing: Bool = false

	/**
	 * Called before the keybord is shown.
	 * @method keyboardWillShow
	 * @since 0.1.0
	 */
	open func keyboardWillShow(_ notification: Notification) {
		self.dispatchKeyboardEvent("beforekeyboardshow", notification: notification)
	}

	/**
	 * Called after the keyboard is shown.
	 * @method keyboardDidShow
	 * @since 0.1.0
	 */
	open func keyboardDidShow(_ notification: Notification) {
		self.dispatchKeyboardEvent("keyboardshow", notification: notification)
	}

	/**
	 * Called before the keyboard is hidden.
	 * @method keyboardWillHide
	 * @since 0.1.0
	 */
	open func keyboardWillHide(_ notification: Notification) {
		self.dispatchKeyboardEvent("beforekeyboardhide", notification: notification)
	}

	/**
	 * Called after the keyboard is hidden.
	 * @method keyboardDidHide
	 * @since 0.1.0
	 */
	open func keyboardDidHide(_ notification: Notification) {
		self.dispatchKeyboardEvent("keyboardhide", notification: notification)
	}

	/**
	 * Called before the keyboard resizes.
	 * @method keyboardWillResize
	 * @since 0.1.0
	 */
	open func keyboardWillResize(_ notification: Notification) {
		self.dispatchKeyboardEvent("beforekeyboardresize", notification: notification)
	}

	/**
	 * Called after the keyboard resizes.
	 * @method keyboardDidResize
	 * @since 0.1.0
	 */
	open func keyboardDidResize(_ notification: Notification) {
		self.dispatchKeyboardEvent("keyboardresize", notification: notification)
	}

	/**
	 * @method dispatchKeyboardEvent
	 * @since 0.1.0
	 * @hidden
	 */
	private func dispatchKeyboardEvent(_ event: String, notification: Notification) {

		guard let application = self.application else {
			return
		}

		if let data = (notification as NSNotification).userInfo {

			let frame = (data[UIResponder.keyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue
			let curve = data[UIResponder.keyboardAnimationCurveUserInfoKey] as! Int
			let duration = data[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double

			let equation: String

			switch (curve) {
				case UIView.AnimationCurve.easeInOut.rawValue:
					equation = "easeinout"
				case UIView.AnimationCurve.easeIn.rawValue:
					equation = "easein"
				case UIView.AnimationCurve.easeOut.rawValue:
					equation = "easeout"
				case UIView.AnimationCurve.linear.rawValue:
					equation = "linear"
				default:
					equation = "cubic-bezier(0.380, 0.700, 0.125, 1.000)"
			}

			let height = Double((frame?.size.height)!)

			let args = [
				self.context.createNumber(height),
				self.context.createNumber(duration * 1000),
				self.context.createString(equation)
			]

			let method: String

			switch (event) {

				case "beforekeyboardshow":
					method = "nativeOnBeforeKeyboardShow"
					break

				case "keyboardshow":
					method = "nativeOnKeyboardShow"
					break

				case "beforekeyboardhide":
					method = "nativeOnBeforeKeyboardHide"
					break

				case "keyboardhide":
					method = "nativeOnKeyboardHide"
					break

				case "beforekeyboardresize":
					method = "nativeOnBeforeKeyboardResize"
					break

				case "keyboardresize":
					method = "nativeOnKeyboardResize"
					break

				default:
					fatalError()
			}

			application.callMethod(method, arguments: args, result: nil)
		}
	}

	//--------------------------------------------------------------------------
	// MARK: Status Bar Management
	//--------------------------------------------------------------------------

	/**
	 * The application controller's status bar visibility status.
	 * @property statusBarVisible
	 * @since 0.1.0
	 */
	open var statusBarVisible: Bool = true {
		didSet {
			UIView.animate(withDuration: 0.350) {
				self.setNeedsStatusBarAppearanceUpdate()
			}
		}
	}

	/**
	 * The application controller's status bar background color.
	 * @property statusBarForegroundColor
	 * @since 0.1.0
	 */
	open var statusBarForegroundColor: UIColor = UIColor.black {
		didSet {
			UIView.animate(withDuration: 0.350) {
				self.setNeedsStatusBarAppearanceUpdate()
			}
		}
	}

	/**
	 * The application controller's status bar background color.
	 * @property statusBarBackgroundColor
	 * @since 0.1.0
	 */
	open var statusBarBackgroundColor: UIColor = UIColor.clear {
		didSet {
			UIView.animate(withDuration: 0.350) {
				self.setNeedsStatusBarAppearanceUpdate()
			}
		}
	}

	/**
	 * @inherited
	 * @property prefersStatusBarHidden
	 * @since 0.1.0
	 */
	override open var prefersStatusBarHidden: Bool {

		if (self.statusBar.isHidden == self.statusBarVisible) {
			self.statusBar.isHidden = self.statusBarVisible == false
		}

		return self.statusBarVisible == false
	}

	/**
	 * @inherited
	 * @property preferredStatusBarStyle
	 * @since 0.1.0
	 */
	override open var preferredStatusBarStyle: UIStatusBarStyle {

		if (self.statusBar.backgroundColor != self.statusBarBackgroundColor) {
			UIView.animate(withDuration: 0.25) {
				self.statusBar.backgroundColor = self.statusBarBackgroundColor
			}
		}

		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 1

		if let components = self.statusBarForegroundColor.cgColor.components {

			if (components.count >= 3) {
				r = components[0]
				g = components[1]
				b = components[2]
			}

			if (components.count >= 4) {
				a = components[3]
			}
		}

		return (r == 1 && g == 1 && b == 1 && a == 1) ? .lightContent : .default
	}
	
	/**
	 * @property statusBar
	 * @since 0.1.0
	 * @hidden
	 */
	private var statusBar: UIView = UIView(frame: .zero)

	//--------------------------------------------------------------------------
	// MARK: Handlers
	//--------------------------------------------------------------------------

	/**
	 * @method handleResourceURL
	 * @since 0.1.0
 	 * @hidden
	 */
	@objc open func handleResourceURL(notification: Notification) {
		if let url = notification.userInfo?["url"] as? URL {
			self.didOpenResourceURL(url)
		}
	}

	/**
	 * @method handleUniversalURL
	 * @since 0.1.0
 	 * @hidden
	 */
	@objc open func handleUniversalURL(notification: Notification) {
		if let url = notification.userInfo?["url"] as? URL {
			self.didOpenUniversalURL(url)
		}
	}

	/**
     * @method handleTouchBegan
     * @since 0.1.0
     * @hidden
     */
	@objc internal func handleTouchBegan(notification: NSNotification) {
		if let touches = notification.userInfo?["touches"] as? Set<UITouch> {
			self.dispatchTouchStart(touches)
		}
	}

	/**
     * @method handleTouchMoved
     * @since 0.1.0
     * @hidden
     */
	@objc internal func handleTouchMoved(notification: NSNotification) {
		if let touches = notification.userInfo?["touches"] as? Set<UITouch> {
			self.dispatchTouchMove(touches)
		}
	}

	/**
     * @method handleTouchEnded
     * @since 0.1.0
     * @hidden
     */
	@objc internal func handleTouchEnded(notification: NSNotification) {
		if let touches = notification.userInfo?["touches"] as? Set<UITouch> {
			self.dispatchTouchEnd(touches)
		}
	}

	/**
     * @method handleTouchCancelled
     * @since 0.1.0
     * @hidden
     */
	@objc internal func handleTouchCancelled(notification: NSNotification) {
		if let touches = notification.userInfo?["touches"] as? Set<UITouch> {
			self.dispatchTouchCancel(touches)
		}
	}

	/**
	 * @method handleEnterBackground
	 * @since 0.1.0
 	 * @hidden
	 */
	@objc open func handleEnterBackground() {
		self.didEnterBackground()
	}

	/**
	 * @method handleEnterForeground
	 * @since 0.1.0
 	 * @hidden
	 */
	@objc open func handleEnterForeground() {
		self.didEnterForeground()
	}

	/**
	 * @method handleKeyboardWillChangeFrame
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func handleKeyboardWillChangeFrame(_ notification: Notification) {

		if let data = (notification as NSNotification).userInfo {

			if (self.keyboardVisible == false) {
				self.keyboardVisible = true
				self.keyboardWillShow(notification)
				return
			}

			let bounds = self.view.bounds
			let fe = (data[UIResponder.keyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue
			let fb = (data[UIResponder.keyboardFrameBeginUserInfoKey]! as AnyObject).cgRectValue

			if (fe?.origin.y != fb?.origin.y && fe?.origin.y == bounds.size.height) {
				if (self.keyboardVisible) {
					self.keyboardVisible = false
					self.keyboardWillHide(notification)
					return
				}
			}

			if (self.keyboardResizing == false) {
				self.keyboardResizing = true
				self.keyboardWillResize(notification)
			}
		}
	}

	/**
	 * @method handleKeyboardDidChangeFrame
	 * @since 0.1.0
	 * @hidden
	 */
	@objc open func handleKeyboardDidChangeFrame(_ notification: Notification) {

		if (self.keyboardResizing) {
			self.keyboardResizing = false
			self.keyboardDidResize(notification)
			return
		}

		if (self.keyboardVisible) {
			self.keyboardDidShow(notification)
		} else {
			self.keyboardDidHide(notification)
		}
	}

	//--------------------------------------------------------------------------
	// MARK: Stylesheet Delegate
	//--------------------------------------------------------------------------

	/**
	 * @method didThrowError
	 * @since 0.1.0
	 * @hidden
	 */
	open func didThrowError(stylesheet: Stylesheet, error: String, col: Int, row: Int, url: String) {
		print("Stylesheet error \(error)")
	}

	//--------------------------------------------------------------------------
	// MARK: Private API
	//--------------------------------------------------------------------------

	/**
	 * @method registerObservers
	 * @since 0.1.0
	 * @hidden
	 */
	private func registerObservers() {
		NotificationCenter.default.addObserver(self, selector: #selector(handleTouchBegan), name: ApplicationDelegate.touchesBeganNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(handleTouchMoved), name: ApplicationDelegate.touchesMovedNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(handleTouchEnded), name: ApplicationDelegate.touchesEndedNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(handleTouchCancelled), name: ApplicationDelegate.touchesCanceledNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(handleResourceURL), name: ApplicationDelegate.openResourceURLNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(handleUniversalURL), name: ApplicationDelegate.openUniversalURLNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(handleEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(handleEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillChangeFrame), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardDidChangeFrame), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
	}

	/**
	 * @method unregisterObservers
	 * @since 0.1.0
	 * @hidden
	 */
	private func unregisterObservers() {

	}

	/**
	 * @method prepareStylesheet
	 * @since 0.1.0
 	 * @hidden
	 */
	private func prepareStylesheet() {

		var insetT: CGFloat = 20
		var insetL: CGFloat = 0
		var insetR: CGFloat = 0
		var insetB: CGFloat = 0

		if #available(iOS 11.0, *) {
			if let window = UIApplication.shared.windows.first {
				insetT = max(window.safeAreaInsets.top, insetT)
				insetL = max(window.safeAreaInsets.left, insetL)
				insetR = max(window.safeAreaInsets.right, insetR)
				insetB = max(window.safeAreaInsets.bottom, insetB)
			}
		}

		self.stylesheet.delegate = self
		self.stylesheet.setVariable("safe-area-inset-top", value: "\(insetT)px")
		self.stylesheet.setVariable("safe-area-inset-left", value: "\(insetL)px")
		self.stylesheet.setVariable("safe-area-inset-right", value: "\(insetR)px")
		self.stylesheet.setVariable("safe-area-inset-bottom", value: "\(insetB)px")

		self.configure(stylesheet: self.stylesheet)
	}

	/**
	 * @method launch
	 * @since 0.1.0
 	 * @hidden
	 */
	private func launch() {

		guard let application = self.application else {
			return
		}
                
		self.display.window = application.window.node

		application.window.width.reset(Double(UIScreen.main.bounds.width), unit: .px, lock: self)
		application.window.height.reset(Double(UIScreen.main.bounds.height), unit: .px, lock: self)
		application.callMethod("nativeOnCreate")

		self.view.addSubview(application.window)
	}

	/**
	 * @method getRotationAnimationDuration
	 * @since 0.1.0
 	 * @hidden
	 */
	open func getRotationAnimationDuration(context: UIViewControllerTransitionCoordinatorContext) -> TimeInterval {
		return context.transitionDuration
	}

	/**
	 * @method getRotationAnimationEquation
	 * @since 0.1.0
 	 * @hidden
	 */
	open func getRotationAnimationEquation(context: UIViewControllerTransitionCoordinatorContext) -> CAMediaTimingFunction {

	 	/*
	 	 * Right now, on iOS 12, the context completionCurve does not match the
	 	 * available curves. Ease in out seems to be the closest
	 	 */

		return CAMediaTimingFunction(name: .easeInEaseOut)
	}

	/**
	 * @method isDev
	 * @since 0.1.0
	 * @hidden
	 */
	private func isDev() -> Bool {
		#if DEBUG
			return true
		#else
			return false
		#endif
	}

	/**
	 * @method isSim
	 * @since 0.1.0
	 * @hidden
	 */
	private func isSim() -> Bool {
		#if arch(i386) || arch(x86_64)
			return true
		#else
			return false
		#endif
	}
}

/**
 * @const kApplicationControllerKey
 * @since 0.1.0
 * @hidden
 */
internal let kApplicationControllerKey = NSObject()
