//
//  StoriesModel.swift
//  BlinqPay-Firebase
//
//  Created by Oluwatobiloba Akinrujomu on 11/02/2022.
//

import Foundation


// MARK: - StoryModel
struct StoryModel: Codable {
  var stories: [Stories]?
  
  init?(data: [String: Any]){
    stories = data["stories"] as? [Stories]
  }
}

// MARK: - Stories
struct Stories: Codable {
  var timestamp: Int?
  var caption: String?
  var id: String?
  var url: String?
  var video: Bool?
  init?(data: [String: Any]) {
    guard let timestamp = data["timestamp"] as? Int,
          let caption = data["caption"] as? String,
          let id = data["id"] as? String,
          let url = data["url"] as? String,
          let video = data["video"] as? Bool else {
            return nil
          }
    
    self.timestamp = timestamp
    self.caption = caption
    self.id = id
    self.url = url
    self.video = video
    
  }
  
}
