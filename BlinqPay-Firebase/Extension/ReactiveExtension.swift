//
//  ReactiveExtension.swift
//  BlinqPay-Firebase
//
//  Created by Oluwatobiloba Akinrujomu on 11/02/2022.
//
import Foundation

import UIKit
import RxCocoa
import RxSwift

extension Reactive where Base: UIViewController {
  
  /// Bindable sink for `startAnimating()`, `stopAnimating()` methods.
  public var isAnimating: Binder<Bool> {
    return Binder(self.base, binding: { (vc, active) in
      if active {
        vc.startAnimating()
      } else {
        vc.stopAnimating()
      }
    })
  }
  
}
