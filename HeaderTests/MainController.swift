//
//  MainController.swift
//  HeaderTests
//
//  Created by Renato Stauffer on 18.11.20.
//

import Foundation
import UIKit
import FloatingPanel

class MainController: UIViewController, FloatingPanelControllerDelegate {
    
    var itemDetailsFpc: FloatingPanelController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        
        itemDetailsFpc = FloatingPanelController()
        itemDetailsFpc.delegate = self
        itemDetailsFpc.set(contentViewController: contentVC)
        itemDetailsFpc.surfaceView.backgroundColor = .clear
        itemDetailsFpc.backdropView.isUserInteractionEnabled = false
        itemDetailsFpc.addPanel(toParent: self)
        itemDetailsFpc.isRemovalInteractionEnabled = true
        itemDetailsFpc.track(scrollView: contentVC.collectionView)
        itemDetailsFpc.move(to: .full, animated: true)
    }
    
    // FloatingPanelControllerDelegate
    
    func floatingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout? {
        return MyLayout()
    }
}


class MyLayout: FloatingPanelLayout {
    
    func insetFor(position: FloatingPanelPosition) -> CGFloat? {
        switch position {
        case .full: return 100
        case .half: return nil
        case .tip:
            return 100
        default: return nil
        }
    }
    
    public var initialPosition: FloatingPanelPosition {
        return .hidden
    }
    
    var supportedPositions: Set<FloatingPanelPosition> {
        return [.tip, .full]
    }
    
    func backdropAlphaFor(position: FloatingPanelPosition) -> CGFloat {
        switch position {
        case .full:
            return 0.5
        case .half:
            return 0.0
        case .tip:
            return 0.0
        case .hidden:
            return 0.0
        }
    }
}
