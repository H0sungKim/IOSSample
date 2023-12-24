//
//  DatePickerViewController.swift
//  IOSSample
//
//  Created by Hosung.Kim on 2023/12/24.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblSelectedTime: UILabel!
    private let dateFormatter: DateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblSelectedTime.text = "Selected Time : \(dateFormatter.string(from: NSDate() as Date))"
        lblCurrentTime.text = "Current Time : \(dateFormatter.string(from: NSDate() as Date))"
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        lblSelectedTime.text = "Selected Time : \(dateFormatter.string(from: sender.date))"
    }
    
    @objc func updateCurrentTime() {
        let currentDate: Date = NSDate() as Date
        if currentDate.compare(datePicker.date) == .orderedAscending {
            view.backgroundColor = UIColor.white
        } else {
            view.backgroundColor = UIColor.red
        }
        lblCurrentTime.text = "Current Time : \(dateFormatter.string(from: currentDate))"
    }
}
