//
//  PlayerView.swift
//  BlinqPay-Firebase
//
//  Created by Oluwatobiloba Akinrujomu on 11/02/2022.
//

import Foundation
import UIKit
import AVKit;

class PlayerView: UIView {
  override static var layerClass: AnyClass {
    return AVPlayerLayer.self;
  }
  var playerLayer: AVPlayerLayer {
    return layer as! AVPlayerLayer;
  }
  var player: AVPlayer? {
    get {
      return playerLayer.player;
    }
    set {
      playerLayer.player = newValue;
    }
  }
}
