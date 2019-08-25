//
//  NavigationViewController.swift
//  Movies
//
//  Created by apple on 25/08/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let yourBackImage = UIImage(named: "Back")
        self.navigationBar.backIndicatorImage = yourBackImage
        self.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        self.navigationBar.setBackgroundImage(UIImage.init(named: "nav_bar"), for: UIBarPosition.top, barMetrics: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
    }

}
