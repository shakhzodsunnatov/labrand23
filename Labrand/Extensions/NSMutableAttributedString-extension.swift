//
//  NSMutableAttributedString-extension.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit



extension NSMutableAttributedString
{
    static func createAttrString(text: String,
                                font: UIFont,
                                lineSpacing: CGFloat,
                                value: Float,
                                textAligment: NSTextAlignment,
                                lineBreakMode: NSLineBreakMode,
                                color: UIColor) -> NSMutableAttributedString
    {
        var attributedString = NSMutableAttributedString(string:text)
        attributedString = NSMutableAttributedString(string:text, attributes: [NSAttributedString.Key.font:font])
        
        let textRange = NSRange(location: 0, length: text.utf16.count)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.alignment = textAligment
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: textRange)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color , range: textRange)
        
        return attributedString
    }
    
    
    static func createKindOfTypeColorAtrStr(fullText: String,
                                            highlitedText: String,
                                            color: UIColor,
                                            font: UIFont,
                                            lineSpacing: CGFloat,
                                            textAligment: NSTextAlignment,
                                            lineBreakMode: NSLineBreakMode) -> NSAttributedString
        
    {
        let atrstr = NSMutableAttributedString(
            string: fullText,
            attributes: [NSAttributedString.Key.font:font])
        
        if let range = fullText.range(of: highlitedText)
        {
            atrstr.addAttribute(.foregroundColor,
                                value: color,
                                range: NSRange(range, in: fullText))
            
            
            let paragraphStyle = NSMutableParagraphStyle()
            
            paragraphStyle.lineSpacing = lineSpacing
            paragraphStyle.lineBreakMode = lineBreakMode
            paragraphStyle.alignment = textAligment
            
            atrstr.addAttribute(NSAttributedString.Key.paragraphStyle,
                                value: paragraphStyle,
                                range: NSRange(range, in: fullText))
        }
        
        
        return atrstr
    }
    
    @discardableResult func normalWithColor(_ text: String,
                                            font:UIFont,
                                            lineSpacing:CGFloat,
                                            value:Float,
                                            textAligment:NSTextAlignment,
                                            lineBreakMode:NSLineBreakMode,
                                            color:UIColor) -> NSMutableAttributedString {
        
        let attrs: [NSAttributedString.Key: Any] = [.font:font,NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color]
        
        let normalString = NSMutableAttributedString(string:text, attributes: attrs)
        let textRange = NSRange(location: 0, length: text.count)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.alignment = textAligment
        normalString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
        normalString.addAttribute(NSAttributedString.Key.kern, value: value, range: textRange)
        normalString.addAttribute(NSAttributedString.Key.foregroundColor, value: color , range: textRange)
        
        append(normalString)
        
        return self
    }
    
    @discardableResult func boldWithColor(_ text: String,
                                          font:UIFont,
                                          lineSpacing:CGFloat,
                                          value:Float,
                                          textAligment:NSTextAlignment,
                                          lineBreakMode:NSLineBreakMode,
                                          color:UIColor) -> NSMutableAttributedString {
        
        let attrs: [NSAttributedString.Key: Any] = [.font:font,NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color]
        
        let normalString = NSMutableAttributedString(string:text, attributes: attrs)
        let textRange = NSRange(location: 0, length: text.count)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.alignment = textAligment
        normalString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
        normalString.addAttribute(NSAttributedString.Key.kern, value: value, range: textRange)
        normalString.addAttribute(NSAttributedString.Key.foregroundColor, value: color , range: textRange)
        
        append(normalString)
        
        return self
    }
    
    
    static func toString(html:String,
                         customFont:UIFont, color: UIColor)->NSAttributedString?
    {
        guard let data = html.data(using: String.Encoding.utf16,
                                   allowLossyConversion: false) else
        {
            return nil
        }
        
        guard let attributedString = try?  NSMutableAttributedString(data: data,
                                                                     options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            else
        {
            return nil
        }
        
        attributedString.enumerateAttribute(NSAttributedString.Key.font,
                                            in: NSRange(location: 0,
                                                        length: attributedString.length),
                                            options: [])
        { (attrs, range, stop) in
            let font = attrs as? UIFont
            
            if font != nil
            {
                attributedString.removeAttribute(NSAttributedString.Key.font, range: range)
                //                attributedString.addAttribute(NSAttributedString.Key.font,
                //                                              value: font!.withSize(fontSize),
                //                                              range: range)
                attributedString.addAttribute(NSAttributedString.Key.font,
                                              value: customFont,
                                              range: range)
                
            }
        }
        let textRange = NSRange(location: 0, length: attributedString.string.count)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color , range: textRange)
        
        
        return attributedString
    }
}

