//
//  ViewController.swift
//  AbdelSagt
//
//  Created by Abdelkoddous Zaidi on 07.04.18.
//  Copyright © 2018 Abdelkoddous Zaidi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label_AbdelSagt: UILabel!
    
    @IBOutlet weak var label_Time: UILabel!
    @IBOutlet weak var label_Score: UILabel!
    
    @IBOutlet weak var button_StartGame: UIButton!
    
    var timer = Timer()
    var abdelSagtTimer = Timer()
    
    var time = 20
    var score = 0
    
    var isGameOn = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(detectSwipeGesture(sender:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(detectSwipeGesture(sender:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(detectSwipeGesture(sender:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(detectSwipeGesture(sender:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        
    }

    
    @IBAction func startTheGame(_ sender: Any) {
        
        if time == 20 {
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decreseTime), userInfo: nil, repeats: true)
            
            updateWords()
            
            button_StartGame.isEnabled = false
            button_StartGame.alpha = 0.25
            
            isGameOn = true
            
        }
        
        if isGameOn == false {
            
            time = 20
            score = 0
            
            label_Time.text = String("Time: \(time)")
            label_Score.text = String("Score: \(score)")
            
            button_StartGame.setTitle("Start Game", for: UIControlState.normal)
            
            
        }
        
        
    }
    
    
    @objc func decreseTime(){
        
        time -= 1
        label_Time.text = String("Time: \(time)")
        
        if time == 0 {
            
            timer.invalidate()
            abdelSagtTimer.invalidate()
            
            button_StartGame.isEnabled = true
            button_StartGame.alpha = 1
            button_StartGame.setTitle("Restart", for: UIControlState.normal)
            
            isGameOn  = false
            
        }
        
    }
    
    
    @objc func updateWords(){
    
        let wordsArray = [
            "Abdel Sagt Recht",
            "Abdel Sagt Links",
            "Abdel Sagt Oben",
            "Abdel Sagt Unten",
            "Recht",
            "links",
            "Oben",
            "Unten"]
        
        let randomWords = arc4random_uniform(UInt32(wordsArray.count))
        
        label_AbdelSagt.text = wordsArray[Int(randomWords)]
        
        abdelSagtTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWords), userInfo: nil, repeats: false)
        
        
    
    }
    
    
    
    @objc func detectSwipeGesture(sender: UISwipeGestureRecognizer) {
        
        if isGameOn == true {
            
            //Detect Right Swipe
            if sender.direction == .right{
                
                abdelSagtTimer.invalidate()
                
                if label_AbdelSagt.text == "Abdel Sagt Recht"{
                    
                    score += 1
                    label_Score.text = String("Score: \(score)")
                    updateWords()
                }
                
                else {
                    
                    score -= 1
                    label_Score.text = String("Score: \(score)")
                    updateWords()
                }
                
                
            }
            
            //Detect Left Swipe
            if sender.direction == .left{
                
                abdelSagtTimer.invalidate()
                
                if label_AbdelSagt.text == "Abdel Sagt Links"{
                    
                    score += 1
                    label_Score.text = String("Score: \(score)")
                    updateWords()
                }
                    
                else {
                    
                    score -= 1
                    label_Score.text = String("Score: \(score)")
                    updateWords()
                }
                
                
            }
            
            //Detect Up Swipe
            if sender.direction == .up{
                
                abdelSagtTimer.invalidate()
                
                if label_AbdelSagt.text == "Abdel Sagt Oben"{
                    
                    score += 1
                    label_Score.text = String("Score: \(score)")
                    updateWords()
                }
                    
                else {
                    
                    score -= 1
                    label_Score.text = String("Score: \(score)")
                    updateWords()
                }
                
                
            }
            
            //Detect Down Swipe
            if sender.direction == .down{
                
                abdelSagtTimer.invalidate()
                
                if label_AbdelSagt.text == "Abdel Sagt Unten"{
                    
                    score += 1
                    label_Score.text = String("Score: \(score)")
                    updateWords()
                }
                    
                else {
                    
                    score -= 1
                    label_Score.text = String("Score: \(score)")
                    updateWords()
                }
                
                
            }
            
        }
        
        
    }
    
    
    
    
    
    


}//Class

