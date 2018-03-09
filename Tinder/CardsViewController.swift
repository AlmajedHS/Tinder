//
//  CardsViewController.swift
//  Tinder
//
//  Created by Hussain Almajed on 3/8/18.
//  Copyright © 2018 Hussain Almajed. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
var cardInitialCenter: CGPoint!
    
    @IBOutlet weak var carImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            cardInitialCenter = carImage.center
            
            
        } else if sender.state == .changed {
            carImage.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            if carImage.center.x > cardInitialCenter.x {
                UIView.animate(withDuration: 0.5, animations: {
                    self.carImage.transform = self.carImage.transform.rotated(by:  0.01)
                })
            }
            else if carImage.center.x < cardInitialCenter.x {
                UIView.animate(withDuration: 0.5, animations: {
                    
                    self.carImage.transform = self.carImage.transform.rotated(by:  -0.01)
                    
                })
            }
            
            carImage.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
        
        }
        
        else if sender.state == .ended {
            
            if translation.x > 50 {
                UIView.animate(withDuration: 0.8, animations: {
                    
                    self.carImage.center = CGPoint(x: 1000, y: self.carImage.center.y)
                }, completion: { (success: Bool) in
                    if success {
                        self.carImage.center = self.cardInitialCenter
                        self.carImage.transform = CGAffineTransform.identity
                        
                    }
                })
            }
            else if translation.x < 50 {
                
                UIView.animate(withDuration: 0.8, animations: {
                    self.carImage.center = CGPoint(x: -1000, y: self.carImage.center.y)
                }, completion: { (success: Bool) in
                    
                    if success {
                        
                        self.carImage.center = self.cardInitialCenter
                        
                        self.carImage.transform = CGAffineTransform.identity
                        
                    }
                })
                
            } else {
                
                carImage.center = cardInitialCenter
                
                carImage.transform = CGAffineTransform.identity
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let profileViewController = segue.destination as! ProfileViewController
        let image = self.carImage.image
        profileViewController.imageSeg = image
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
