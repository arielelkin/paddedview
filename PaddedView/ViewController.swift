//
//  ViewController.swift
//  PaddedView
//
//  Created by Ariel Elkin on 15/03/16.
//  Copyright © 2016 Project A Ventures GmbH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let redLabel = UILabel()

    func tapped() {
        redLabel.text = redLabel.text == nil ? labelText : nil
    }

    let labelText = "I'm padded. Tap me."


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()

        let touchGesture = UITapGestureRecognizer(target: self, action: "tapped")
        view.addGestureRecognizer(touchGesture)


        var viewsDict = [String: UIView]()

        redLabel.text = labelText
        redLabel.backgroundColor = UIColor.redColor()
        let redLabelPadded = PaddedView(content: redLabel, bottomPadding: 10)
        viewsDict["redLabel"] = redLabelPadded
        view.addSubview(redLabelPadded)


        let blueView = UIView()
        blueView.backgroundColor = UIColor.blueColor()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        viewsDict["blueView"] = blueView
        view.addSubview(blueView)



        let imageView = UIImageView(image: UIImage(named: "juggler"))
        imageView.contentMode = .Center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        viewsDict["imageView"] = imageView
        view.addSubview(imageView)


let constraints = [
    "H:|-[imageView]-|",
    "H:|-[redLabel]-|",
    "H:|-[blueView]-|",

    "V:|-30-[imageView][redLabel][blueView(20)]"

    ].flatMap {
        NSLayoutConstraint.constraintsWithVisualFormat($0, options: [], metrics: nil, views: viewsDict)
}

NSLayoutConstraint.activateConstraints(constraints)
    }
}
