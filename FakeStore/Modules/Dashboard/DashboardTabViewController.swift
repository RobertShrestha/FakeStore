//
//  DashboardTabViewController.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import UIKit

class DashboardTabViewController: UITabBarController {
    weak var coordinator: DashboardTabBarCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
