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
        let x: CGFloat = -45
        let y: CGFloat = -26
        let w: CGFloat = view.bounds.size.width
        let h: CGFloat = 202
        imageView.frame = CGRect(x: x, y: y, width: w - x, height: h - y)

        // set widget height
        preferredContentSize = CGSize(width: w, height: h + 45)
    }


    // MARK: - Actions

    @IBAction func imageViewTapped(sender: UIButton) {
        if let URL = NSURL(string: "http://www.meteo.pl/um/metco/mgram_pict.php?ntype=0u&fdate=2014111506&row=360&col=241&lang=en") {
            extensionContext?.openURL(URL, completionHandler: nil)
        }
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
