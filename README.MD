`PaddedView` is a `UIView` subclass that sets its `layoutMargins` to `UIEdgeInsetsZero` if its content's height or width is zero.

This makes it easy to create views that need to show padding, but which need the padding to disappear when their content is nil. 

## Usage

```swift

//setup your view:
let redLabel = UILabel()
redLabel.text = "I'm padded. Tap me"
redLabel.backgroundColor = UIColor.redColor()

//Add it as the content of a PaddedView, include the padding:
let redLabelPadded = PaddedView(content: redLabel, bottomPadding: 10)

//add the padded view to the superview:
viewsDict["redLabel"] = redLabelPadded
view.addSubview(redLabelPadded)


//Set up your other constraints:
let constraints = [
    "H:|-[imageView]-|",
    "H:|-[redLabel]-|",
    "H:|-[blueView]-|",

    "V:|-30-[imageView][redLabel][blueView(20)]"

    ].flatMap {
        NSLayoutConstraint.constraintsWithVisualFormat($0, options: [], metrics: nil, views: viewsDict)
}

NSLayoutConstraint.activateConstraints(constraints)


//When you set the content of the paddedview to nil, its size will 
//become zero, and its padding will disappear:
func tapped() {
    redLabel.text = nil
}


```

## Demo

![](Screenshots/iOS-screenshot-1.png)

![](Screenshots/iOS-screenshot-2.png)

