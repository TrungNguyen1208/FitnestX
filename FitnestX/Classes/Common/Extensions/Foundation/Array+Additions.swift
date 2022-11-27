import Foundation

extension Array {
  mutating func appendIfNotNil(_ item: Element?) {
    if let item = item {
      self.append(item)
    }
  }
}
