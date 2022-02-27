//
//  Helpers.swift
//  MisterAuto-MiniApp
//
//  Created by Brahim ELMSSILHA on 2/27/22.
//

import UIKit

extension String: Error {}

extension Decodable {
    
   static func decode(_ data: Data) throws -> Self {
        
        let decoder = JSONDecoder.init()
        return try decoder.decode(Self.self, from: data)
    }
}

@objc extension UIViewController {
    
    func showError(_ error: Error) {
        let alert = UIAlertController()
        alert.title = "Oops"
        alert.message = error.localizedDescription
        alert.addAction(.init(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
    
}


extension String {
    func emojiToImage() -> UIImage? {
        let size = CGSize(width: 30, height: 35)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set()
        let rect = CGRect(origin: CGPoint(), size: size)
        UIRectFill(CGRect(origin: CGPoint(), size: size))
        (self as NSString).draw(in: rect, withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
