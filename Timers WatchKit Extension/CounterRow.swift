//
//  CounterRow.swift
//  Timers
//
//  Created by Paul Gibbons on 10/6/16.
//  Copyright © 2016 Paul Gibbons. All rights reserved.
//

import WatchKit

class CounterRow: NSObject {

    @IBOutlet var counterMinus: WKInterfaceButton!
    @IBOutlet var counterZero: WKInterfaceButton!
    @IBOutlet var counterValue: WKInterfaceLabel!
    @IBOutlet var counterPlus: WKInterfaceButton!
    var count = 0;
    
    @IBAction func counterPlusClick() {
        self.count += 1;
        self.counterValue.setText(String(self.count));
        WKInterfaceDevice.current().play(WKHapticType.directionUp);
    }
    
    @IBAction func counterMinusClick() {
        self.count = max(self.count - 1, 0);
        self.counterValue.setText(String(self.count));
        WKInterfaceDevice.current().play(WKHapticType.directionDown);
    }
    
    @IBAction func counterZeroClick() {
        self.count = 0;
        self.counterValue.setText(String(self.count));
    }
    
}
