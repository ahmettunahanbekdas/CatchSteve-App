//
//  ViewController.swift
//  CatchSteveGame
//
//  Created by Ahmet Tunahan Bekdaş on 6.05.2023.
//

import UIKit

class ViewController: UIViewController {
    

    var timer = Timer()
    var hideTimer = Timer()
    var counter = 0
    var score = 0
    var highScore = 0
    var steveArray = [UIImageView]()
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var steve1: UIImageView!
    @IBOutlet weak var steve2: UIImageView!
    @IBOutlet weak var steve3: UIImageView!
    @IBOutlet weak var steve4: UIImageView!
    @IBOutlet weak var steve5: UIImageView!
    @IBOutlet weak var steve6: UIImageView!
    @IBOutlet weak var steve7: UIImageView!
    @IBOutlet weak var steve8: UIImageView!
    @IBOutlet weak var steve9: UIImageView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        counter = 10
        timeLabel.text = String(counter)
        
        // Hello World
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CountDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideSteve), userInfo: nil, repeats: true)
        
        
        steve1.isUserInteractionEnabled = true
        steve2.isUserInteractionEnabled = true
        steve3.isUserInteractionEnabled = true
        steve4.isUserInteractionEnabled = true
        steve5.isUserInteractionEnabled = true
        steve6.isUserInteractionEnabled = true
        steve7.isUserInteractionEnabled = true
        steve8.isUserInteractionEnabled = true
        steve9.isUserInteractionEnabled = true
        
    
        let recoginizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recoginizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recoginizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recoginizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recoginizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recoginizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recoginizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recoginizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recoginizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        
        steve1.addGestureRecognizer(recoginizer1)
        steve2.addGestureRecognizer(recoginizer2)
        steve3.addGestureRecognizer(recoginizer3)
        steve4.addGestureRecognizer(recoginizer4)
        steve5.addGestureRecognizer(recoginizer5)
        steve6.addGestureRecognizer(recoginizer6)
        steve7.addGestureRecognizer(recoginizer7)
        steve8.addGestureRecognizer(recoginizer8)
        steve9.addGestureRecognizer(recoginizer9)
        
        steveArray = [steve1, steve2, steve3, steve4, steve5, steve6, steve7, steve8, steve9]
        
        hideSteve()
    }
    
    
    @objc func hideSteve (){
        for steve in steveArray{
            steve.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(steveArray.count - 1)))
        steveArray[random].isHidden = false
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "SCORE : \(score)"
    }
    
    @objc func CountDown(){
        counter -= 1
        timeLabel.text = String(counter)
        print(counter)
        if counter == 0 {
            print("Tıme Over")
            print("Hello World")
            timer.invalidate()
            hideTimer.invalidate()
            
            for steve in steveArray{
                steve.isHidden = true
            }
        
      
        if self.score > self.highScore{
            self.highScore = self.score
            highScoreLabel.text = "HIGH SCORE : \(self.highScore)"
            UserDefaults.standard.set(self.score, forKey: "HIGH SCORE")
        }
        
        let alert = UIAlertController(title: "TTimes's Up", message: "Do you want to play again ?", preferredStyle: .alert)
        let thanksButton = UIAlertAction(title: "Thanks", style: .cancel, handler : nil)
        let replayButton = UIAlertAction(title: "Replay", style: .default ) { (UIAlertAction) in
            
            self.score = 0 // skoru sıfırla
            self.scoreLabel.text = "SCORE: \(self.score)"
            self.counter = 10 // sayacı 10 yap.
            self.timeLabel.text = String(self.counter)
          
           self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.CountDown), userInfo: nil, repeats: true)
           self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideSteve), userInfo: nil, repeats: true)
            
        }
            
        alert.addAction(thanksButton)
        alert.addAction(replayButton)
        self.present(alert, animated: true, completion: nil)
            
            }
        }
    }





