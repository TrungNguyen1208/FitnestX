import Foundation
import UIKit

extension String {
  func getNumbers() -> [NSNumber] {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    let charset = CharacterSet.init(charactersIn: " ,.")
    return matches(for: "[+-]?([0-9]+([., ][0-9]*)*|[.][0-9]+)").compactMap { string in
      return formatter.number(from: string.trimmingCharacters(in: charset))
    }
  }
  
  // https://stackoverflow.com/a/54900097/4488252
  func matches(for regex: String) -> [String] {
    guard let regex = try? NSRegularExpression(pattern: regex, options: [.caseInsensitive]) else { return [] }
    let matches  = regex.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
    return matches.compactMap { match in
      guard let range = Range(match.range, in: self) else { return nil }
      return String(self[range])
    }
  }
}

extension UIImage {
  func getFileSizeInfo(allowedUnits: ByteCountFormatter.Units = .useMB,
                       countStyle: ByteCountFormatter.CountStyle = .file) -> String? {
    // https://developer.apple.com/documentation/foundation/bytecountformatter
    let formatter = ByteCountFormatter()
    formatter.allowedUnits = allowedUnits
    formatter.countStyle = countStyle
    return getSizeInfo(formatter: formatter)
  }
  
  func getFileSize(allowedUnits: ByteCountFormatter.Units = .useMB,
                   countStyle: ByteCountFormatter.CountStyle = .memory) -> Double? {
    guard let num = getFileSizeInfo(allowedUnits: allowedUnits, countStyle: countStyle)?.getNumbers().first else { return nil }
    return Double(truncating: num)
  }
  
  func getSizeInfo(formatter: ByteCountFormatter, compressionQuality: CGFloat = 1.0) -> String? {
    guard let imageData = jpegData(compressionQuality: compressionQuality) else { return nil }
    return formatter.string(fromByteCount: Int64(imageData.count))
  }
}
