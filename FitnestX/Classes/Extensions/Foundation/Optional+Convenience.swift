import Foundation

extension Optional where Wrapped == String {
  var orEmpty: String {
    return self ?? ""
  }
}

extension Optional where Wrapped == Int {
  var orZero: Int {
    return self ?? 0
  }
}

extension Optional where Wrapped == Bool {
  var orFalse: Bool {
    return self ?? false
  }
}

extension Optional where Wrapped == Double {
  var orZero: Double {
    return self ?? 0
  }
}

extension Optional where Wrapped == Float {
  var orZero: Float {
    return self ?? 0
  }
}
