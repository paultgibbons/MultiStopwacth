//
//  ViewController.swift
//  Timers
//
//  Created by Paul Gibbons on 10/6/16.
//  Copyright © 2016 Paul Gibbons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var start1: UIButton!
    @IBOutlet weak var stop1: UIButton!
    @IBOutlet weak var reset1: UIButton!
    var timer1: Timer? = nil;
    var count1: Int = 0;
    
    @IBOutlet weak var counter1: UILabel!
    @IBOutlet weak var counterPlus1: UIButton!
    @IBOutlet weak var counterMinus1: UIButton!
    @IBOutlet weak var counterReset1: UIButton!
    var counterValue1 = 0;
    
    
    @IBAction func startTimer1(_ sender: AnyObject) {
        if (self.timer1 == nil) {
        self.timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timer1DidFire), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stopTimer1(_ sender: AnyObject) {
        self.timer1?.invalidate();
        self.timer1 = nil;
        
    }
    
    @IBAction func resetTimer1(_ sender: AnyObject) {
        self.count1 = 0;
        self.time1.text = toTime(count: self.count1);
        self.timer1?.invalidate();
        self.timer1 = nil;
    }
    
    func timer1DidFire() {
        self.count1 += 1;
        self.time1.text = toTime(count: self.count1);
    }
    
    @IBAction func clickPlus1(_ sender: AnyObject) {
        self.counterValue1 += 1;
        self.counter1.text = String(counterValue1);
    }
    
    @IBAction func clickMinus1(_ sender: AnyObject) {
        self.counterValue1 -= 1;
        self.counterValue1 = max(self.counterValue1, 0);
        self.counter1.text = String(counterValue1);
    }
    
    @IBAction func clickCounterReset1(_ sender: AnyObject) {
        self.counterValue1 = 0;
        self.counter1.text = String(counterValue1);
    }
    
    @IBAction func clickAuthor(_ sender: AnyObject) {
        if let url = URL(string: "http://paultgibbons.com") {
            let options = [UIApplicationOpenURLOptionUniversalLinksOnly : false]
            UIApplication.shared.open(url, options: options, completionHandler: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func toTime(count: Int) -> String {
        let seconds = count % 60;
        let totalMniutes = max((count - seconds),0)/60;
        let minutes = totalMniutes % 60;
        let hours = max((count - (minutes * 60) - seconds),0)/(60*60);
        var result = String(seconds);
        if (seconds < 10) {
            result = "0" + result;
        }
        result = String(minutes) + ":" + result;
        if (minutes < 10 && hours > 0) {
            result = "0" + result;
        }
        if (hours > 0) {
            result = String(hours) + ":" + result;
        }
        return result;
    }

}

