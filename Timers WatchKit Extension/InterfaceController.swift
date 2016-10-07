//
//  InterfaceController.swift
//  Timers WatchKit Extension
//
//  Created by Paul Gibbons on 10/6/16.
//  Copyright © 2016 Paul Gibbons. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var counterTable: WKInterfaceTable!
    @IBOutlet var addCounter: WKInterfaceButton!
    @IBOutlet var subtractCounter: WKInterfaceButton!
    var numberOfCounters: Int = 1;
    
    @IBOutlet var timerTable: WKInterfaceTable!
    @IBOutlet var addTimer: WKInterfaceButton!
    @IBOutlet var subtractTimer: WKInterfaceButton!
    var numberOfTimers: Int = 1;
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        self.counterTable.setNumberOfRows(self.numberOfCounters, withRowType: "CounterRow");
        self.timerTable.setNumberOfRows(self.numberOfTimers, withRowType: "TimerRow");
    }
    
    @IBAction func addCounterClick() {
        let indexset = IndexSet.init(integer: self.numberOfCounters);
        self.numberOfCounters += 1;
        self.counterTable.insertRows(at: indexset, withRowType: "CounterRow");
    }
    
    @IBAction func subtractCounterClick() {
        if (self.numberOfCounters > 0) {
            self.numberOfCounters -= 1;
            let indexset = IndexSet.init(integer: self.numberOfCounters);
            self.counterTable.removeRows(at: indexset);
        }
    }
    
    @IBAction func addTimerClick() {
        let indexset = IndexSet.init(integer: self.numberOfTimers);
        self.numberOfTimers += 1;
        self.timerTable.insertRows(at: indexset, withRowType: "TimerRow");
    }
    
    @IBAction func subtractTimerClick() {
        if (self.numberOfTimers > 0) {
            self.numberOfTimers -= 1;
            let indexset = IndexSet.init(integer: self.numberOfTimers);
            self.timerTable.removeRows(at: indexset);
        }
    }
    
    @IBAction func clearAll() {
        self.counterTable.removeRows(at: NSIndexSet(indexesIn: NSRange(location: 0, length: self.counterTable.numberOfRows)) as IndexSet);
        
        self.timerTable.removeRows(at: NSIndexSet(indexesIn: NSRange(location: 0, length: self.timerTable.numberOfRows)) as IndexSet);
        
        self.numberOfTimers = 0;
        self.numberOfCounters = 0;
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
