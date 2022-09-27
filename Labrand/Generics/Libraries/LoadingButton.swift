//
//  LoadingButton.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit


class LoadingButton: Button {
    // MARK: - Public variables
    
    public var isLoading: Bool = false
    
    // MARK: - Package-protected variables
    /**
     The loading indicator used with the button.
     */
    open var indicator: UIView & IndicatorProtocol = UIActivityIndicatorView()
    
    // Private properties
    private var loaderWorkItem: DispatchWorkItem?
    // Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        let activity = UIActivityIndicatorView(style: .large)
        activity.color = .white
        indicator = activity
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     Display the loader inside the button.

     - Parameter userInteraction: Enable the user interaction while displaying the loader.
     - Parameter completion:      The completion handler.
     */
    open func showLoader(userInteraction: Bool = false, _ completion: LBCallback = nil) {
        showLoader([titleLabel, imageView], userInteraction: userInteraction, completion)
    }
    /**
     Show a loader inside the button with image.

     - Parameter userInteraction: Enable user interaction while showing the loader.
     */
    open func showLoaderWithImage(userInteraction: Bool = false) {
        showLoader([self.titleLabel], userInteraction: userInteraction)
    }
    /**
     Display the loader inside the button.

     - Parameter viewsToBeHidden: The views such as titleLabel, imageViewto be hidden while showing loading indicator.
     - Parameter userInteraction: Enable the user interaction while displaying the loader.
     - Parameter completion:      The completion handler.
    */
    open func showLoader(_ viewsToBeHidden: [UIView?], userInteraction: Bool = false, _ completion: LBCallback = nil) {
        guard !self.subviews.contains(indicator) else { return }
        // Set up loading indicator and update loading state
        isLoading = true
        self.isUserInteractionEnabled = userInteraction
        indicator.radius = min(0.7*self.frame.height/2, indicator.radius)
        indicator.alpha = 0.0
        self.addSubview(self.indicator)
        // Clean up
        loaderWorkItem?.cancel()
        loaderWorkItem = nil
        // Create a new work item
        loaderWorkItem = DispatchWorkItem { [weak self] in
            guard let self = self, let item = self.loaderWorkItem, !item.isCancelled else { return }
            UIView.transition(with: self, duration: 0.2, options: .curveEaseOut, animations: {
                viewsToBeHidden.forEach {
                    $0?.alpha = 0.0
                }
                self.indicator.alpha = 1.0
            }) { _ in
                guard !item.isCancelled else { return }
                self.isLoading ? self.indicator.startAnimating() : self.hideLoader()
                completion?()
            }
        }
        loaderWorkItem?.perform()
    }
    /**
     Hide the loader displayed.

     - Parameter completion: The completion handler.
     */
    open func hideLoader(_ completion: LBCallback = nil) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            guard self.subviews.contains(self.indicator) else { return }
            // Update loading state
            self.isLoading = false
            self.isUserInteractionEnabled = true
            self.indicator.stopAnimating()
            // Clean up
            self.indicator.removeFromSuperview()
            self.loaderWorkItem?.cancel()
            self.loaderWorkItem = nil
            // Create a new work item
            self.loaderWorkItem = DispatchWorkItem { [weak self] in
                guard let self = self, let item = self.loaderWorkItem, !item.isCancelled else { return }
                UIView.transition(with: self, duration: 0.2, options: .curveEaseIn, animations: {
                    self.titleLabel?.alpha = 1.0
                    self.imageView?.alpha = 1.0
                }) { _ in
                    guard !item.isCancelled else { return }
                    completion?()
                }
            }
            self.loaderWorkItem?.perform()
        }
    }
    // layoutSubviews
    open override func layoutSubviews() {
        super.layoutSubviews()
        indicator.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
    }
    // MARK: Touch
    // touchesBegan
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.backgroundColor = self.color == UIColor.clear ? .lightGray : self.color?.getColorTint()
    }
    // touchesEnded
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.backgroundColor = self.color
    }
    // touchesCancelled
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        self.backgroundColor = self.color
    }
    // touchesMoved
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        self.backgroundColor = self.color == UIColor.clear ? .lightGray : self.color?.getColorTint()
    }
}
// MARK: - UIActivityIndicatorView
extension UIActivityIndicatorView: IndicatorProtocol {
    public var radius: CGFloat {
        get {
            return self.frame.width/2
        }
        set {
            self.frame.size = CGSize(width: 2*newValue, height: 2*newValue)
            self.setNeedsDisplay()
        }
    }

//    public var color: UIColor {
//        get {
//            return self.tintColor
//        }
//        set {
//            let ciColor = CIColor(color: newValue)
//            #if os(iOS)
//            self.style = newValue.RGBtoCMYK(red: ciColor.red, green: ciColor.green, blue: ciColor.blue).key > 0.5 ? .gray : .white
//            #endif
//            self.tintColor = newValue
//        }
//    }
    // unused
    public func setupAnimation(in layer: CALayer, size: CGSize) {}
}


public typealias LBCallback = (() -> Void)?

// MARK: - UIColor
extension UIColor {
    /**
     Convert RGB value to CMYK value.

     - Parameter red: The red value of RGB.
     - Parameter green: The green value of RGB.
     - Parameter blue: The blue value of RGB.

     Returns a 4-tuple that represents the CMYK value converted from input RGB.
     */
    public func RGBtoCMYK(
        red: CGFloat,
        green: CGFloat,
        blue: CGFloat
    ) -> (
        cyan: CGFloat,
        magenta: CGFloat,
        yellow: CGFloat,
        key: CGFloat
    ) {
        // Base case
        if red == 0, green == 0, blue == 0 {
            return (0, 0, 0, 1)
        }
        var cyan = 1 - red
        var magenta = 1 - green
        var yellow = 1 - blue
        let minCMY = min(cyan, magenta, yellow)
        cyan = (cyan - minCMY) / (1 - minCMY)
        magenta = (magenta - minCMY) / (1 - minCMY)
        yellow = (yellow - minCMY) / (1 - minCMY)
        return (cyan, magenta, yellow, minCMY)
    }
    /**
     Convert CMYK value to RGB value.

     - Parameter cyan: The cyan value of CMYK.
     - Parameter magenta: The magenta value of CMYK.
     - Parameter yellow: The yellow value of CMYK.
     - Parameter key: The key/black value of CMYK.

     Returns a 3-tuple that represents the RGB value converted from input CMYK.
     */
    public func CMYKtoRGB(
        cyan: CGFloat,
        magenta: CGFloat,
        yellow: CGFloat,
        key: CGFloat
    ) -> (
        red: CGFloat,
        green: CGFloat,
        blue: CGFloat
    ) {
        let red = (1 - cyan) * (1 - key)
        let green = (1 - magenta) * (1 - key)
        let blue = (1 - yellow) * (1 - key)
        return (red, green, blue)
    }
    /**
     Get the tint color of the current color.
     */
    public func getColorTint() -> UIColor {
        let ciColor = CIColor(color: self)
        let originCMYK = RGBtoCMYK(red: ciColor.red, green: ciColor.green, blue: ciColor.blue)
        let kVal = originCMYK.key > 0.3 ? originCMYK.key - 0.2 : originCMYK.key + 0.2
        let tintRGB = CMYKtoRGB(cyan: originCMYK.cyan, magenta: originCMYK.magenta, yellow: originCMYK.yellow, key: kVal)
        return UIColor(red: tintRGB.red, green: tintRGB.green, blue: tintRGB.blue, alpha: 1.0)
    }
}
// MARK: - UIButton
extension UIButton {
    /**
     Set button image for all button states

     - Parameter image: The image to be set to the button.
     */
    public func setImage(_ image: UIImage?) {
        for state : UIControl.State in [.normal, .highlighted, .disabled, .selected, .focused, .application, .reserved] {
            self.setImage(image, for: state)
        }
    }
    /**
     Set button title for all button states

     - Parameter text: The text to be set to the button title.
     */
    public func setTitle(_ text: String?) {
        for state : UIControl.State in [.normal, .highlighted, .disabled, .selected, .focused, .application, .reserved] {
            self.setTitle(text, for: state)
        }
    }
}
// MARK: - UIImage
extension UIImage {
    /**
     Create color rectangle as image.

     - Parameter color: The color to be created as an UIImage
     - Parameter size:  The size of the UIImage, no need to be set when creating
     */
    public convenience init?(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0.0)
        color.setFill()
        UIRectFill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let cgImage = image?.cgImage else { return nil}
        self.init(cgImage: cgImage)
    }
}
// MARK: UIView
extension UIView {
    /**
     Set the corner radius of the view.

     - Parameter color:        The color of the border.
     - Parameter cornerRadius: The radius of the rounded corner.
     - Parameter borderWidth:  The width of the border.
     */
    open func setCornerBorder(color: UIColor? = nil, cornerRadius: CGFloat = 15.0, borderWidth: CGFloat = 1.5) {
        self.layer.borderColor = color != nil ? color!.cgColor : UIColor.clear.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    /**
     Set the shadow layer of the view.

     - Parameter bounds:       The bounds in CGRect of the shadow.
     - Parameter cornerRadius: The radius of the shadow path.
     - Parameter shadowRadius: The radius of the shadow.
     */
    open func setAsShadow(bounds: CGRect, cornerRadius: CGFloat = 0.0, shadowRadius: CGFloat = 1) {
        self.backgroundColor = UIColor.clear
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = shadowRadius
        self.layer.masksToBounds = true
        self.clipsToBounds = false
    }
    /**
     Add subviews and make it prepared for AutoLayout.

     - Parameter views: The views to be added as subviews of current view.
     */
    public func addSubViews(_ views: [UIView]) {
        views.forEach({
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
    }
    /**
     Make the specified view (in parameter) to be centered of current view.

     - Parameter view: The view to be positioned to the center of current view.
     */
    public func centerSubView(_ view: UIView) {
        self.addConstraints(
            [
                NSLayoutConstraint(item: view, attribute: .centerX,
                                   relatedBy: .equal,
                                   toItem: self, attribute: .centerX,
                                   multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: view, attribute: .centerY,
                                   relatedBy: .equal,
                                   toItem: self, attribute: .centerY,
                                   multiplier: 1.0, constant: 0.0)
            ]
        )
    }
}

public protocol IndicatorProtocol {
    /**
     The radius of the indicator.
     */
    var radius: CGFloat { get set }
    /**
     The primary color of the indicator.
     */
//    var color: UIColor { get set }
    /**
     Current status of animation, read-only.
     */
    var isAnimating: Bool { get }
    /**
     Start animating.
     */
    func startAnimating()
    /**
     Stop animating and remove layer.
     */
    func stopAnimating()
    /**
     Set up the animation of the indicator.

     - Parameter layer: The layer to present animation.
     - Parameter size:  The size of the animation.
     */
    func setupAnimation(in layer: CALayer, size: CGSize)
}

