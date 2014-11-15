//
//  TodayViewController.swift
//  ICM Today
//
//  Created by Maciej Konieczny on 2014-11-15.
//  Copyright (c) 2014 Maciej Konieczny. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet weak var imageView: UIImageView!


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // "crop" image
        let w = view.bounds.size.width
        let h: CGFloat = 202
        imageView.frame = CGRect(x: -45, y: -26, width: w, height: h)
        println("\(imageView.frame)")

        // set widget height
        preferredContentSize = CGSize(width: w, height: h)
    }


    // MARK: - NCWidgetProviding
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }

    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }

}
