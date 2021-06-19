import Foundation
import UIKit

public extension UIFont {
    enum Family: String, CaseIterable {
        case system = "HelveticaNeue" //".SFUI"
        
        public static let defaultFamily = Family.system
    }
    
    enum CustomWeight: String, CaseIterable {
        case regular = "", medium, light, heavy, bold, thin, black
    }
    
    enum Size: CGFloat, CaseIterable {
        case h1 = 28, h2 = 22, h3 = 20
        case bodyL = 17, bodyM = 15, bodyS = 13
        case caption1 = 12, caption2 = 11
        case callout = 16
    }
    
    private class func stringName(_ family: Family, _ weight: CustomWeight) -> String {
        let fontWeight = weight.rawValue
        let familyName = family.rawValue
        return fontWeight.isEmpty ? "\(familyName)" : "\(familyName)-\(fontWeight)"
    }
}

public extension UIFont {
    
    convenience init(_ size: Size, _ weight: CustomWeight) {
        self.init(.defaultFamily, size, weight)
    }
    
    convenience init(_ family: Family = .defaultFamily,
                     _ size: Size, _ weight: CustomWeight) {
        self.init(name: UIFont.stringName(family, weight), size: size.rawValue)!
    }
}
