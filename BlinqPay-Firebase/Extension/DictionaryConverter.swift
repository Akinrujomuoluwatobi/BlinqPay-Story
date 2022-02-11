//
//  DictionaryConverted.swift
//  BlinqPay-Firebase
//
//  Created by Oluwatobiloba Akinrujomu on 11/02/2022.
//

import Foundation

extension Dictionary where Key == String, Value: Any {
  
  func object<T: Decodable>() -> T? {
    if let data = try? JSONSerialization.data(withJSONObject: self, options: []) {
      return try? JSONDecoder().decode(T.self, from: data)
    } else {
      return nil
    }
  }
}

protocol DictionaryConvertor {
    func toDictionary() -> [String : Any]
}

extension DictionaryConvertor {
  
  func toDictionary() -> [String : Any] {
    let reflect = Mirror(reflecting: self)
    let children = reflect.children
    let dictionary = toAnyHashable(elements: children)
    return dictionary
  }
  
  func toAnyHashable(elements: AnyCollection<Mirror.Child>) -> [String : Any] {
    var dictionary: [String : Any] = [:]
    for element in elements {
      if let key = element.label {
        
        if let collectionValidHashable = element.value as? [AnyHashable] {
          dictionary[key] = collectionValidHashable
        }
        
        if let validHashable = element.value as? AnyHashable {
          dictionary[key] = validHashable
        }
        
        if let convertor = element.value as? DictionaryConvertor {
          dictionary[key] = convertor.toDictionary()
        }
        
        if let convertorList = element.value as? [DictionaryConvertor] {
          dictionary[key] = convertorList.map({ e in
            e.toDictionary()
          })
        }
      }
    }
    return dictionary
  }
}
