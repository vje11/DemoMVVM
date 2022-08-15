//
//  BaseVC.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupAppearence()
    }
    
    func setupAppearence() {
        setBackgroundImage(AppImages.backgroundImage, contentMode: .scaleAspectFill)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    deinit {
        print("Deinit \(self)")
    }
}
