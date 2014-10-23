//
//  ColorViewController.swift
//  Colorboard
//
//  Created by Troy Abel on 10/23/14.
//  Copyright (c) 2014 Troy Abel. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let color = currentColorDescription.color
        // Get the RGB values out of the UIColor object
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        color.getRed(&red,
            green: &green,
            blue: &blue,
            alpha: nil)
        // Set the initial slider values
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        // Set the background color and text field value
        view.backgroundColor = color
        textField.text = currentColorDescription.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Remove the 'Done' button if this is an existing color
        if existingColor {
        navigationItem.rightBarButtonItem = nil
        }
    }

    
    override func viewWillDisappear(animated: Bool) {
            super.viewWillDisappear(animated)
            // Give a default in case the view's background color is nil
            currentColorDescription.color = view.backgroundColor ?? UIColor.whiteColor()
            currentColorDescription.name = textField.text
    }
    
    //Dismiss the modually presented screen
    
    @IBAction func dismiss(sender: AnyObject) {
         presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var textField: UITextField!
    
    var existingColor = false
    var currentColorDescription : ColorDescription!
    
    
    
    
    @IBAction func changeColor(sender: AnyObject) {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let newColor = UIColor(red: red,
        green: green,
        blue: blue,
        alpha: 1)
        view.backgroundColor = newColor
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
