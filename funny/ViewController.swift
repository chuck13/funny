//
//  ViewController.swift
//  funny
//
//  Created by Aaron King on 22/09/2016.
//  Copyright © 2016 rightwon. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var display: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func appendDigit(_ sender: NSButton) {
        let digit = sender.title
        if isTyping
        {
            display.stringValue = display.stringValue + digit
        }
        else
        {
            isTyping = true
            display.stringValue = digit
        }
    }
    @IBAction func returnNumber (_ sender: NSButton) {
        finishTyping ()
        calculate ()
    }
    @IBAction func operate(_ sender: NSButton) {
        let op = sender.title
        switch (op)
        {
        case "+":
            finishTyping()
            break
        default:
            break
        }
    }
    
    var isTyping = false
    var operandArray = Array<Double>()
    func calculate ()
    {
        if operandArray.count >= 2
        {
            display.doubleValue = plus (operandArray.removeLast(), operandArray.removeLast())
        }
    }
    func finishTyping ()
    {
        if isTyping
        {
            isTyping = false;
            operandArray.append (display.doubleValue)
            print (operandArray)
        }
    }
    func plus (_ op1: Double, _ op2: Double) -> Double
    {
        return op1 + op2
    }
}

