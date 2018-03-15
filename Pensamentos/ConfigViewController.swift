//
//  ConfigViewController.swift
//  Pensamentos
//
//  Created by Usuário Convidado on 14/03/18.
//  Copyright © 2018 fiap. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {

   
    @IBOutlet weak var swAutorefresh: UISwitch!
    @IBOutlet weak var lbTimeInterval: UILabel!
    @IBOutlet weak var slTimeInterval: UISlider!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatView()
    }
    
    func formatView() {
        swAutorefresh.setOn(config.autorefresh, animated: false)
        slTimeInterval.setValue(Float(config.timeInterval), animated: false)
        scColorScheme.selectedSegmentIndex = config.colorScheme
        changeTimeIntervalLabel(with: config.timeInterval)
    }
    
    func changeTimeIntervalLabel(with value: Double) {
        lbTimeInterval.text = "Mudar após \(Int(value)) segundos"
    }
    
    @IBAction func changeAutorefresh(_ sender: UISwitch) {
        config.autorefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeIntervalLabel(with: value)
        config.timeInterval = value
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }

}
