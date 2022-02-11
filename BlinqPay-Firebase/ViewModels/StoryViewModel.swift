//
//  StoryViewModel.swift
//  BlinqPay-Firebase
//
//  Created by Oluwatobiloba Akinrujomu on 11/02/2022.
//

import Foundation
import RxSwift
import FirebaseFirestore
import ObjectMapper

class StoriesListViewModel {
  public var storiesViewModel: PublishSubject<[Stories]> = PublishSubject()
  public let loading: PublishSubject<Bool> = PublishSubject()
  private var stories: [Stories] = []
  private var storyModel: StoryModel?
  private var db = Firestore.firestore()
  
  private var disposable = DisposeBag()
  
  public func fetchStories() {
    self.loading.onNext(true)
    
    db.collection("story").getDocuments() { (querySnapshot, err) in
      if let err = err {
        print("Error getting documents: \(err)")
      } else {
        for document in querySnapshot!.documents {
          let data = document.data()
          let stories = data["stories"] as? [[String: Any]] ?? []
          for story in stories {
            let indStory = Stories(data: story)
            self.stories.append(indStory!)
          }
          
        }
      }
      
      self.storiesViewModel.onNext(self.stories)
    }
    
  }
  
}
