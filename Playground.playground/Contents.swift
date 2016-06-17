//
//  PaddedView.playground
//  PaddedView
//
//  Created by Ariel Elkin on 17/06/16.
//  Copyright © 2016 Project A Ventures GmbH. All rights reserved.
//

import UIKit
import XCPlayground
import PaddedView

// Open this playground from
// PaddedView.xcworkspace.

// To see the live preview, open the
// Assistant Editor (Cmd + Alt + ,)
// and select 'Timeline', not 'Manual',
// in its top bar.

class ContainerView: UIView {

    let redLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .purpleColor()

        redLabel.text = "Click somewhere."
        redLabel.textAlignment = .Center
        redLabel.backgroundColor = .redColor()

        let redLabelPadded = PaddedView(content: redLabel, bottomPadding: 20)
        addSubview(redLabelPadded)


        let blueView = UIView()
        blueView.backgroundColor = .blueColor()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(blueView)

        let constraints = [
            "H:|-[redLabelPadded]-|",
            "H:|-[blueView]-|",

            //the bottom anchor of redLabelPadded
            //is equal to the top anchor of blueView.
            //The padding will be visible only when
            //the content of redLabel is not nil.
            "V:|-30-[redLabelPadded][blueView(20)]"

            ].flatMap {
                NSLayoutConstraint.constraintsWithVisualFormat(
                    $0,
                    options: [],
                    metrics: nil,
                    views: ["redLabelPadded": redLabelPadded, "blueView": blueView]
                )
        }

        NSLayoutConstraint.activateConstraints(constraints)

        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))

        redLabel.layer.borderWidth = 4
        redLabel.layer.borderColor = UIColor.blackColor().CGColor
        redLabelPadded.layer.borderWidth = 1
        redLabelPadded.layer.borderColor = UIColor.whiteColor().CGColor

    }

    //When you set the content of the paddedview to nil, its size will
    //become zero, and its padding will disappear:
    func tapped() {
        redLabel.text = redLabel.text == nil ? "Click somewhere" : nil
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let containerView = ContainerView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 200, height: 300)))


XCPlaygroundPage.currentPage.liveView = containerView


