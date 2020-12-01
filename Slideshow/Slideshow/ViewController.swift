//
//  ViewController.swift
//  Slideshow
//
//  Created by The Developer
//

import UIKit

class ViewController: UIViewController {

    static var index = 0
    
    static var images = [UIImage(named: "xcode"), UIImage(named: "swift"), UIImage(named: "swiftUI"),  UIImage(named: "iPhone"),]
    let imageView =  UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        imageView.center.x = view.center.x
        imageView.center.y = view.center.y
        imageView.image = ViewController.images[ViewController.index]
        imageView.contentMode = .scaleAspectFill
        imageView.sendSubviewToBack(view)
        view.addSubview(imageView)
        view.addSubview(label)
        
        
      
        
       
        let swipeLeft =  UISwipeGestureRecognizer(target: self, action: #selector(swipeManage(sender:)))
        let swipeRight =  UISwipeGestureRecognizer(target: self, action: #selector(swipeManage(sender:)))
        swipeLeft.direction = .left
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
        
    }
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "\(index + 1)/\(images.count)"
        label.frame = CGRect(x: 350, y: 630 , width: 250, height: 60)
        label.layer.cornerRadius = 12
        label.font = UIFont(name: "ArialMT", size: 30)
        return label
    }()

    
    func indexManager() {
        
        
        if ViewController.index >= ViewController.images.count {
            ViewController.index = 0
        }
        else if ViewController.index <= -1{
            ViewController.index = ViewController.images.count - 1
        }
        updateUI()
    }
    
    func updateUI() {
        imageView.image = ViewController.images[ViewController.index]
    }
    
    func checkWhichImageNumber(){
        label.text = "\(ViewController.index + 1)/\(ViewController.images.count)"
    }

    @objc func swipeManage(sender: UISwipeGestureRecognizer)  {
        if sender.state == .ended {
            switch sender.direction {
            
            case .left:
                ViewController.index += 1
                indexManager()
                checkWhichImageNumber()
            case .right:
                ViewController.index -= 1
                indexManager()
                checkWhichImageNumber()
            default:
                break
            }
        }
    }
    
    @objc func left() {
        ViewController.index += 1
        indexManager()
    }
    @objc func right() {
        ViewController.index -= 1
        indexManager()
    }
    
}

