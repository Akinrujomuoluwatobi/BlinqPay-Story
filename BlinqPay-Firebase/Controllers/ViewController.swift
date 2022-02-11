//
//  ViewController.swift
//  BlinqPay-Firebase
//
//  Created by Oluwatobiloba Akinrujomu on 10/02/2022.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  private var stories = PublishSubject<[Stories]>()
  
  var storiesVm = StoriesListViewModel()
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBinding()
    storiesVm.fetchStories()
  }
  
  private func setupBinding() {
    storiesVm.loading.bind(to: self.rx.isAnimating).disposed(by: disposeBag)
    
    storiesVm
        .storiesViewModel
        .observe(on: MainScheduler.instance)
        .bind(to: self.stories)
        .disposed(by: disposeBag)
    
    storiesVm.storiesViewModel.bind(to: tableView.rx.items(cellIdentifier: "StoryTableViewCell", cellType: StoryTableViewCell.self)) {  (row,story,cell) in
      cell.cellStory = story
    }.disposed(by: disposeBag)
  }
  
}
