import Foundation

extension Date {
  
  init(milliseconds: Int64) {
    self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
  }
  
  func isBetween(_ startDate: Date, and endDate: Date) -> Bool {
    return startDate <= self && self < endDate
  }
  /// Get date from x months front/back from now
  /// ex: today is: `13-May-2021`, addingMonths is `-1`
  /// Then the result of `func getDate(from addingMonths: Int)` is: `13-April-2021`
  func getDate(from addingMonths: Int) -> Date? {
    let calendar = Calendar.current
    var components = DateComponents()
    components.calendar = calendar
    components.timeZone = TimeZone(secondsFromGMT: 0)
    components.month = addingMonths
    return calendar.date(byAdding: components, to: self)
  }
  
  var startOfDay: Date {
    return Calendar.current.startOfDay(for: self)
  }
  
  var endOfDay: Date? {
    var components = DateComponents()
    components.day = 1
    components.second = -1
    return Calendar.current.date(byAdding: components, to: startOfDay)
  }
  
  var millisecondsSince1970: UInt64 {
    return UInt64((self.timeIntervalSince1970 * 1000.0).rounded())
  }
  
  func dayNumberOfWeek() -> Int? {
    return Calendar.current.dateComponents([.weekday], from: self).weekday
  }
  
  func dateWithTime(hours: Int, minutes: Int, seconds: Int = 0) -> Date? {
    let calendar = Calendar.current
    var dateComponents = calendar.dateComponents([.day, .month, .year], from: self)
    dateComponents.hour = hours
    dateComponents.minute = minutes
    dateComponents.second = seconds
    return calendar.date(from: dateComponents)
  }
  
  static func dayOfWeek(from string: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter.date(from: string)
  }
  
  func toMillis() -> Int64 {
    return Int64(self.timeIntervalSince1970 * 1000)
  }
  
  func dateByAdding(hourNumber: Int) -> Date? {
    let cal = Calendar.current
    let resultDate = cal.date(byAdding: .hour, value: hourNumber, to: self)
    return resultDate
  }
  
  func dateByAdding(dayNumber: Int) -> Date? {
    let cal = Calendar.current
    let resultDate = cal.date(byAdding: .day, value: dayNumber, to: self)
    return resultDate
  }
  
  func dateByAdding(yearNumber: Int) -> Date? {
    let cal = Calendar.current
    let resultDate = cal.date(byAdding: .year, value: yearNumber, to: self)
    return resultDate
  }
}
