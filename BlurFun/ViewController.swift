//
//  ViewController.swift
//  BlurFun
//
//  Created by iKilledAppl3 on 7/11/16.
//  Copyright © 2016 iKilledAppl3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blurLabel: UILabel!
    @IBOutlet weak var bokehImageView: UIImageView!
    @IBOutlet var swipeMeAway: UISwipeGestureRecognizer!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    var blurView:UIVisualEffectView?
    var blurredView:UIVisualEffectView?
    var vibrantLabel = UILabel()
    
    override func viewDidLoad() {
        
    // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        
        //Gesture recognizer for a new blur to show.
        self.view.addGestureRecognizer(tapGesture)
        
        //Makes the image fit the screen
        bokehImageView.bounds = view.bounds
        bokehImageView.center = view.center
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func swipeMeAwayAction(sender: AnyObject) {
        
        blurredView!.removeFromSuperview()
        blurLabel.text = "Blur has been removed!"
        blurLabel.textColor = UIColor.whiteColor()
        bokehImageView.image = UIImage (named: "Bokeh2.png")
        
    }
    
    @IBAction func swipeGestureAction(sender: AnyObject) {
        
        blurView!.removeFromSuperview()
        blurLabel.text = "Blur has been removed!"
        blurLabel.textColor = UIColor.whiteColor()
    }

    @IBAction func tapGestureAction(sender: AnyObject) {
        
      
        let blurEffect = UIBlurEffect (style: .Light)
        blurredView = UIVisualEffectView (effect: blurEffect)
        view.addSubview(blurredView!)
        blurredView!.frame = view.bounds
        blurredView?.addGestureRecognizer(swipeMeAway)
        
        
        
    }
    
    
    @IBAction func blurButtonTapped(sender: AnyObject) {
        
        //Blur the screen!
        let blurEffect = UIBlurEffect (style: .Dark)
        blurView = UIVisualEffectView (effect: blurEffect)
        blurView!.center = view.center
        view.addSubview(blurView!)
        /* if you want the blurView to be the same size as the view controller then try this
         
         blurView!.frame = view.bounds
         
         other wise try the method below for custom sizes
         
         // Custom size for the blur view.
         // this size parameter gives the blur view kind of a folder like shape (SpringBoard Folders (Homescreen)).
         blurView!.frame.size = CGSize (width: 320, height: 320)
         
        */
        
        //Match the size of the screen
        blurView!.frame = view.bounds
        
        //For adding corner radius and making it looking more rounded.
        blurView!.clipsToBounds = true
        blurView!.layer.cornerRadius = 35.0
        
        //Add a gesture recognizer so user can dismiss the blur!
        blurView?.addGestureRecognizer(swipeGesture)
        
        //Add vibrancy effect to the blur view
        let vibrantView = UIVibrancyEffect (forBlurEffect: blurEffect)
        let vibrancyEffect = UIVisualEffectView (effect: vibrantView)
        vibrancyEffect.frame = blurView!.bounds
        
        //add the vibrantEffect as a subview of the blurView controller class (UIViewController)
        blurView?.contentView.addSubview(vibrancyEffect)

        //Add text to display in the vibrant view
        vibrantLabel.text = "Content is Blurred!"
        vibrantLabel.font = UIFont.systemFontOfSize(25.0)
        vibrantLabel.textColor = UIColor.whiteColor()
        vibrantLabel.center = blurView!.center
        vibrantLabel.textAlignment = .Center
        vibrantLabel.sizeToFit()
        
        //add the label as a subview of the vibrancyEffect controller class (UIViewController)
        vibrancyEffect.contentView.addSubview(vibrantLabel)
        
        
        
        
        
    }

}

