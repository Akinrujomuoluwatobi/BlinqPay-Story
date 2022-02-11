//
//  UIViewControllerExtension.swift
//  BlinqPay-Firebase
//
//  Created by Oluwatobiloba Akinrujomu on 11/02/2022.
//

import Foundation
import UIKit
extension UIViewController {
  func startAnimating() {
    AnimateloadingView().startAnimating()
  }
  
  func stopAnimating() {
    AnimateloadingView().stopAnimating()
  }
}
