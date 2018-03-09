//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Hussain Almajed on 3/8/18.
//  Copyright © 2018 Hussain Almajed. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var cardImage: UIImageView!
    var imageSeg: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImage.image = imageSeg
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDon(_ sender: UITapGestureRecognizer) {
        print("??")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
