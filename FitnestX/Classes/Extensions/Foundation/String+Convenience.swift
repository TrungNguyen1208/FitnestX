import Foundation

extension String {
  var isDigits: Bool {
    if isEmpty { return false }
    // The inverted set of .decimalDigits is every character minus digits
    let nonDigits = CharacterSet.decimalDigits.inverted
    return rangeOfCharacter(from: nonDigits) == nil
  }
  
  func cleanUpWhitespaces() -> String {
    return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
  }
  
  func cleanUpNonDigits() -> String {
    return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
  }
  
  func cleanUpCharacter(_ character: Character) -> String {
    return replacingOccurrences(of: String(character), with: "",
                                options: NSString.CompareOptions.literal,
                                range: nil)
  }
  
  func containsNonDigits() -> Bool {
    let cleaned = cleanUpNonDigits()
    return cleaned.count != count
  }
  
  func contains(find: String) -> Bool {
    return self.range(of: find) != nil
  }
  
  func containsIgnoringCase(find: String) -> Bool {
    return self.range(of: find, options: .caseInsensitive) != nil
  }
  
  func containsNonAlphanumerics() -> Bool {
    return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil
  }
  
  var nilIfEmpty: String? {
    return self.isEmpty ? nil : self
  }
  
  var hasLettersOnly: Bool {
    rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
  }
  
  func trimDownExtraWhiteSpaces() -> String {
    let arrayOfString = self.split(separator: " ")
    let joinedString = arrayOfString.joined(separator: " ")
    return joinedString
  }
  
  func toDouble() -> Double? {
    return NumberFormatter().number(from: self)?.doubleValue
  }
  
  func toInt() -> Int? {
    return NumberFormatter().number(from: self)?.intValue
  }
}
