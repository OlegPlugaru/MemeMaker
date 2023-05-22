//
//  ViewController.swift
//  MemeMaker
//
//  Created by Whoami on 06.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    
    let topChoices = [
        CaptionOption(emoji: "🕶️", caption: "You know what's cool?"),
        CaptionOption(emoji: "💥", caption: "You know what makes me mad?"),
        CaptionOption(emoji: "💕", caption: "You know what I love?")
    ]
    let bottomChoices = [
        CaptionOption(emoji: "🧑🏿‍💻", caption: "BTW I Use Arch!"),
        CaptionOption(emoji: "🤯", caption: "PHP devs telling people they are a software developer"),
        CaptionOption(emoji: "🐧", caption: "You always have access to the latest and greatest software")
    ]
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topSegmentedControl.removeAllSegments()
        bottomSegmentedControl.removeAllSegments()
        
        // Do any additional setup after loading the view.
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
            
        }
        
        topSegmentedControl.selectedSegmentIndex = 0
        
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        setCorrectCaptions()
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
       setCorrectCaptions()
    
    }
    
    func setCorrectCaptions() {
        let topSegmentedIndex = topSegmentedControl.selectedSegmentIndex
        
        let bottomSegmentedIndex = bottomSegmentedControl.selectedSegmentIndex
        
        topCaptionLabel.text = topChoices[topSegmentedIndex].caption
        bottomCaptionLabel.text = bottomChoices[bottomSegmentedIndex].caption
        
        }
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
}




