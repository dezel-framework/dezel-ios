import UIKit

/**
 * @class Toast
 * @super UIView
 * @since 0.1.0
 */
open class Toast {

	//--------------------------------------------------------------------------
	// MARK: Enum
	//--------------------------------------------------------------------------

	/**
	 * @enum Style
	 * @since 0.1.0
	 */
	public enum Style {
		case black
		case white
	}

	/**
	 * @enum Location
	 * @since 0.1.0
	 */
	public enum Location {
		case top
		case bottom
	}

	//--------------------------------------------------------------------------
	// MARK: Properties
	//--------------------------------------------------------------------------

	/**
	 * @property font
	 * @since 0.1.0
	 */
	public var font: UIFont = UIFont.boldSystemFont(ofSize: 17)

	/**
	 * @property text
	 * @since 0.1.0
	 */
	public var text: String

	/**
	 * @property location
	 * @since 0.1.0
	 */
	public var location: Location = .top

	/**
	 * @property distance
	 * @since 0.1.0
	 */
	public var distance: CGFloat = 64

	/**
	 * @property duration
	 * @since 0.1.0
	 */
	public var duration: Double = 0.250

	/**
	 * @property timeout
	 * @since 0.1.0
	 */
	public var timeout: Double = 1.000

	/**
	 * @property style
	 * @since 0.1.0
	 */
	public var style: Style = .white

	/**
	 * @property paddingLeft
	 * @since 0.1.0
	 */
	public var paddingLeft: CGFloat = 32

	/**
	 * @property paddingRight
	 * @since 0.1.0
	 */
	public var paddingRight: CGFloat = 32

	/**
	 * @property view
	 * @since 0.1.0
	 * @hidden
	 */
	private var view: UIView

	/**
	 * @property label
	 * @since 0.1.0
	 * @hidden
	 */
	private var label: UILabel = UILabel(frame: .zero)

	//--------------------------------------------------------------------------
	// MARK: Methods
	//--------------------------------------------------------------------------

	/**
	 * @constructor
	 * @since 0.1.0
	 * @hidden
	 */
	required public init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	/**
	 * Initializes the notification.
	 * @constructor
	 * @since 0.1.0
	 */
	public required init(view: UIView, text: String) {

		self.view = view
		self.text = text

		self.label.textAlignment = .center

		self.label.layer.cornerRadius = 24

		self.label.layer.shadowColor = UIColor.black.cgColor
		self.label.layer.shadowOffset = .zero
		self.label.layer.shadowOpacity = 0.25
		self.label.layer.shadowRadius = 15.0

		self.label.layer.zPosition = 100
	}

	/**
	 * Initializes the notification.
	 * @constructor
	 * @since 0.1.0
	 */
	public func show() {

		self.view.addSubview(self.label)

		switch (self.style) {

			case .black:
				self.label.layer.backgroundColor = UIColor.black.cgColor
				self.label.textColor = UIColor.white

			case .white:
				self.label.layer.backgroundColor = UIColor.white.cgColor
				self.label.textColor = UIColor.black
		}

		self.label.font = self.font
		self.label.text = self.text
		self.label.sizeToFit()

		let paddingL = self.paddingLeft
		let paddingR = self.paddingRight

		let remaining = view.bounds.width - paddingL - paddingR
		if (remaining < 0) {

			// TODO
			// Make the padding smaller to fit its content.

		}

		self.label.bounds.size.height = 48
		self.label.bounds.size.width += paddingL
		self.label.bounds.size.width += paddingR

		self.present()
	}

	/**
	 * @method present
	 * @since 0.1.0
	 * @hidden
	 */
	private func present() {

		var offsetT: CGFloat = 0
		var offsetB: CGFloat = 0

		if #available(iOS 11.0, *) {
			if let window = UIApplication.shared.windows.first {
				offsetT = window.safeAreaInsets.top
				offsetB = window.safeAreaInsets.bottom
			}
		}

		self.label.frame.origin.x = self.getFrameX()
		self.label.frame.origin.y = self.getFrameY()

		UIView.animate(withDuration: self.duration, delay: 0, options: .curveEaseInOut, animations: {

			switch (self.location) {
				case .top:
					self.label.transform = CGAffineTransform(translationX: 0, y: (offsetT + self.distance))
				case .bottom:
					self.label.transform = CGAffineTransform(translationX: 0, y: (offsetB + self.distance) * -1)
			}

		}, completion: { done in

			self.dismiss()

		})

	}

	/**
	 * @method dismiss
	 * @since 0.1.0
	 * @hidden
	 */
	private func dismiss() {

		UIView.animate(withDuration: self.duration, delay: self.timeout, options: .curveEaseInOut, animations: {

			self.label.transform = CGAffineTransform.identity

		}, completion: { done in

			self.label.removeFromSuperview()

		})

	}

	/**
	 * @method getFrameX
	 * @since 0.1.0
	 * @hidden
	 */
	private func getFrameX() -> CGFloat {
		return self.view.bounds.center().x - self.label.bounds.center().x
	}

	/**
	 * @method getFrameY
	 * @since 0.1.0
	 * @hidden
	 */
	private func getFrameY() -> CGFloat {

		let origin: CGFloat
		let offset: CGFloat

		switch (self.location) {

			case .top:
				origin = 0
				offset = self.view.bounds.height

			case .bottom:
				origin = self.view.bounds.height
				offset = 0
		}

		return origin - offset
	}
}
