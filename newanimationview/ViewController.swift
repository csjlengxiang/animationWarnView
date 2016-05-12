//
//  ViewController.swift
//  newanimationview
//
//  Created by csj on 16/5/12.
//  Copyright © 2016年 csj. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tf: UITextField!
    
    @IBAction func click(sender: AnyObject) {
        //self.lb.text  = tf.text
        self.myView.alpha = 0
        self.myView.setNeedsLayout()
        self.myView.layoutIfNeeded()
 
        UIView.animateWithDuration(1.5, animations: {
                self.myView.alpha = 1
            self.lb.snp_updateConstraints { (make) in
                make.center.equalTo(self.myView)
                make.margins.equalTo(EdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
            }
            
            self.myView.snp_updateConstraints(closure: { (make) in
                make.centerY.equalTo(self.myView.superview!).offset(80)
            })
            
            self.view.layoutIfNeeded()
            
            }) { (_) in
                
                UIView.animateWithDuration(0.8, animations: {

                    self.myView.alpha = 0
                    self.lb.snp_updateConstraints { (make) in
                        make.center.equalTo(self.myView)
                        make.margins.equalTo(EdgeInsets(top: 10, left: -50, bottom: 10, right: -50))
                        
                    }
                    self.view.layoutIfNeeded()
                    
                    }, completion: { (_) in
                        self.lb.snp_updateConstraints { (make) in
                            make.center.equalTo(self.myView)
                            make.margins.equalTo(EdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
                        }
                        self.myView.snp_updateConstraints(closure: { (make) in
                            make.centerY.equalTo(self.myView.superview!)
                        })
                })
            }
        
    
        
    }
    var myView: UIView = UIView()
    var lb: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //myView.frame = CGRectMake(0, 0, 100, 50)
        myView.backgroundColor = UIColor.redColor()
        myView.layer.cornerRadius = 20
        //lb.backgroundColor = UIColor.yellowColor()
        lb.textColor = UIColor.blackColor()
        lb.text = "你好啊啊啊啊啊啊"
        lb.textAlignment = .Center
        lb.font = UIFont(name: "", size: 20);
        myView.clipsToBounds = true
        myView.addSubview(lb)
        self.view.addSubview(myView)
        
        
        myView.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        lb.snp_makeConstraints { (make) in
            make.center.equalTo(self.myView)
            make.margins.equalTo(EdgeInsets(top: 10, left: 15, bottom: 10, right: 15))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

