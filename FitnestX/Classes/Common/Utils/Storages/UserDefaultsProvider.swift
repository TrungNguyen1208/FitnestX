import Foundation

protocol UserDefaultsProvider {
  func set(_ value: Any?, forKey defaultName: String)
  func bool(forKey defaultName: String) -> Bool
  func integer(forKey defaultName: String) -> Int
  func double(forKey defaultName: String) -> Double
  func string(forKey defaultName: String) -> String?
  func date(forKey defaultName: String) -> Date?
  func value(forKey defaultName: String) -> Any?
  func removeObject(forKey: String)
  func object(forKey defaultName: String) -> Any?
  func setCustomObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
  func getCustomObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object? where Object: Decodable
}

extension UserDefaults: UserDefaultsProvider {
  func date(forKey defaultName: String) -> Date? {
    guard let date = value(forKey: defaultName) as? Date  else { return nil }
    return date
  }

  func setCustomObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
    let encoder = JSONEncoder()
    do {
      let data = try encoder.encode(object)
      set(data, forKey: forKey)
    } catch {
      print("Unable to encode object into data")
    }
  }

  func getCustomObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object? where Object: Decodable {
    guard let data = object(forKey: forKey) else { return nil }
    let decoder = JSONDecoder()
    do {
      let object = try decoder.decode(type, from: data as! Data)
      return object
    } catch {
      print("Unable to decode object into given type")
    }
    return nil
  }
}
