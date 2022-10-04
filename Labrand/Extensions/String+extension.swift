//
//  String+extension.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import Foundation
import UIKit


extension String
{
    static  func decimalNumberFormatter(number: String) -> String
    {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.groupingSeparator = " "
        numberFormatter.numberStyle = .decimal
        if let convertNumber = Float(number),
           let stringNumber = numberFormatter.string(from: NSNumber(value: convertNumber))
        {
            return stringNumber
        }
        
        return number
    }
    
    
    
    func whitespaceString(font: UIFont = UIFont.systemFont(ofSize: 15), width: CGFloat) -> String
    {
        let kPadding: CGFloat = 20
        let mutable = NSMutableString(string: "")
        let attribute = [NSAttributedString.Key.font: font]
        while mutable.size(withAttributes: attribute).width < width - (2 * kPadding)
        {
            mutable.append(" ")
        }
        
        
        return mutable as String
    }
    
    
    
    func applyPatternOnNumbers(pattern: String,
                               replacmentCharacter: Character) -> String
    {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]",
                                                    with: "",
                                                    options: .regularExpression)
        
        for index in 0 ..< pattern.count
        {
            guard index < pureNumber.count else
            {
                return pureNumber
            }
            
            
            let stringIndex = String.UTF16View.Index(encodedOffset: index)

            //                String.Index(encodedOffset: index)
            
            
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else
            {
                continue
            }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        
        
        return pureNumber
    }
    
    
    func capitalizingFirstLetter(str: String) -> String
    {
        let first = String(str.prefix(1)).capitalized
        let other = String(str.dropFirst())
        return first + other
    }
    
    
    func convertDate() -> String {
        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.dateFormat = "yyyy-MM-dd" //this your string date format
        dateFormatter.timeZone = TimeZone.current
//        dateFormatter.locale = Locale(identifier: Localize.currentLanguage())
        
        if let convertedDate = dateFormatter.date(from: self) {
            
            dateFormatter.dateFormat = "EE, d MMMM" //this is what you want to convert format
            
            return dateFormatter.string(from: convertedDate)
            
        } else {
            return self
        }
    }
    
    
    
    static func textHeight(width: CGFloat, font: UIFont, text: String, numberOfLines: Int = 0) -> CGFloat
    {
        let label = UILabel()
        
        label.numberOfLines = numberOfLines
        label.attributedText =
        NSMutableAttributedString.creatAttrString(text: text,
                                                  font: font,
                                                  lineSpacing: 1.08,
                                                  value: 0.34,
                                                  textAligment: .left,
                                                  lineBreakMode: .byWordWrapping,
                                                  color: UIColor.black0)
        label.frame.size.width = width
        label.sizeToFit()
        
        
        return label.frame.size.height
    }


    static func textWidth(font: UIFont, text: String) -> CGFloat {
        let label = UILabel()

        label.attributedText =
        NSMutableAttributedString.creatAttrString(text: text,
                                                  font: font,
                                                  lineSpacing: 1.08,
                                                  value: 0.34,
                                                  textAligment: .left,
                                                  lineBreakMode: .byWordWrapping,
                                                  color: UIColor.black0)
        label.sizeToFit()


        return label.frame.size.width
    }
    
    
    //    func strikeThrough() -> NSAttributedString {
    //            let attributeString =  NSMutableAttributedString(string: self)
    //            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(0,attributeString.length))
    //            return attributeString
    //        }
    
    static func generateRandomDigits(_ digitNumber: Int) -> String {
        var number = ""
        for i in 0..<digitNumber {
            var randomNumber = arc4random_uniform(10)
            while randomNumber == 0 && i == 0 {
                randomNumber = arc4random_uniform(10)
            }
            number += "\(randomNumber)"
        }
        
        
        return number
    }
    
    static func random(of n: Int) -> String {
        let digits = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        return String(Array(0..<n).map { _ in digits.randomElement()! })
    }
}

