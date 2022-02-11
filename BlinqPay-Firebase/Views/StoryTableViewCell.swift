//
//  StoryTableViewCell.swift
//  BlinqPay-Firebase
//
//  Created by Oluwatobiloba Akinrujomu on 11/02/2022.
//

import UIKit
import Kingfisher
import AVKit
import AVFoundation

class StoryTableViewCell: UITableViewCell {
  
  @IBOutlet weak var storyImageView: UIImageView!
  @IBOutlet weak var caption: UILabel!
  @IBOutlet weak var timeStampLabel: UILabel!
  @IBOutlet weak var videoView: PlayerView!
  
  public var cellStory : Stories! {
    didSet {
      
      if cellStory.video! {
        let url = NSURL(string: cellStory.url ?? "");
        let avPlayer = AVPlayer(url: url! as URL);
        videoView.playerLayer.player = avPlayer;
        videoView.player?.play()
        storyImageView.isHidden = true
        videoView.isHidden = false
      } else {
        let url = URL(string: cellStory.url ?? "")
        storyImageView.kf.setImage(with: url)
        videoView.isHidden = true
        storyImageView.isHidden = false
      }
      
      self.caption.text = cellStory.caption
      
      if let timeStamp = cellStory.timestamp {
        let date = Date(timeIntervalSince1970: Double(timeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        self.timeStampLabel.text = localDate
      }
      
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    storyImageView.layer.cornerRadius = 20
    storyImageView.clipsToBounds = true
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
