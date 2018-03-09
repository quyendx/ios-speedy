//
//  UIImageViewExtensions.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import PINRemoteImage

public extension UIImageView {
    /// Make image view blurry
	public func blur(withStyle style: UIBlurEffectStyle = .light) {
		let blurEffect = UIBlurEffect(style: style)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = bounds
		blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		addSubview(blurEffectView)
		clipsToBounds = true
	}

    /// Blurred version of an image view
	public func blurred(withStyle style: UIBlurEffectStyle = .light) -> UIImageView {
		let imgView = self
		imgView.blur(withStyle: style)
		return imgView
	}

    /// Async set image from url string
    public func pin_setImage(_ urlString: String?, placeholderImage: UIImage? = nil, completion: ((_ image: UIImage?) -> Void)? = nil) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            image = placeholderImage
            completion?(placeholderImage)

            return
        }

        pin_setImage(from: url, placeholderImage: placeholderImage, completion: { result in
            completion?(result.image)
        })

    }
    
}
