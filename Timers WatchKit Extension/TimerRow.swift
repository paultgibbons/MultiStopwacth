//
//  TimerRow.swift
//  Timers
//
//  Created by Paul Gibbons on 10/6/16.
//  Copyright © 2016 Paul Gibbons. All rights reserved.
//

import WatchKit

class TimerRow: NSObject {
    @IBOutlet var timer: WKInterfaceTimer!
    @IBOutlet var startStopButton: WKInterfaceButton!
    @IBOutlet var timerReset: WKInterfaceButton!
    
    private var isPaused = true;
    private var elapsedTime = 0.0;
    private var startTime: NSDate = NSDate();
    
    @IBAction func startStopClick() {
        if (isPaused) { // press start
            isPaused = false;
            timer.setDate(
                NSDate().addingTimeInterval(-elapsedTime) as Date
            );
            timer.start();
            startTime = NSDate();
            WKInterfaceDevice.current().play(WKHapticType.start);
            startStopButton.setBackgroundColor(UIColor.init(red: 64.0, green: 0.0, blue: 0.0, alpha: 0.5))
            startStopButton.setTitle("Stop");
        } else { // pressed stop
            elapsedTime += NSDate().timeIntervalSince(startTime as Date);
            timer.stop();
            isPaused = true;
            WKInterfaceDevice.current().play(WKHapticType.stop);
            startStopButton.setBackgroundColor(UIColor.init(red: 0.0, green: 128.0, blue: 0.0, alpha: 0.5));
            startStopButton.setTitle("Start");
        }
    }
    
    @IBAction func timerResetClick() {
        if (!isPaused) {
            self.startStopClick();
        }
        timer.setDate(NSDate() as Date);
        elapsedTime = 0;
    }
    
}
