//
//  PaddedView.swift
//  PaddedView
//
//  Created by Ariel Elkin on 15/03/16.
//  Copyright © 2016 Project A Ventures GmbH. All rights reserved.
//

import UIKit

/**
 PaddedView is a `UIView` subclass that sets its `layoutMargins` to
 `UIEdgeInsetsZero` if its content's height or width is zero.

 `PaddedView` sets its `translatesAutoresizingMaskIntoConstraints`
 property to `false`.

 */
public class PaddedView: UIView {

    let contentView: UIView
    var padding: UIEdgeInsets

    init(content: UIView, padding: UIEdgeInsets) {
        self.contentView = content
        self.padding = padding

        super.init(frame: CGRectZero)

        self.layoutMargins = padding

        translatesAutoresizingMaskIntoConstraints = false

        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)

        let constraints = [
            "H:|-[contentView]-|",
            "V:|-[contentView]-|"

            ].flatMap {
                NSLayoutConstraint.constraintsWithVisualFormat($0, options: [], metrics: nil, views: ["contentView": self.contentView])
        }
        NSLayoutConstraint.activateConstraints(constraints)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        if contentView.bounds.size.width == 0 || contentView.bounds.size.height == 0 {
            self.layoutMargins = UIEdgeInsetsZero
        }
        else {
            self.layoutMargins = padding
        }
    }

    //Most padding tends to be at the bottom:
    public convenience init(content: UIView, bottomPadding: CGFloat) {
        self.init(content: content, padding: UIEdgeInsets(top: 0, left: 0, bottom: bottomPadding, right: 0))
    }

    public convenience init(content: UIView, topPadding: CGFloat) {
        self.init(content: content, padding: UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: 0))
    }


    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
