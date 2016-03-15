`PaddedView` is a `UIView` subclass that sets its `layoutMargins` to `UIEdgeInsetsZero` if its content's height or width is zero.

This makes it easy to create views that need to show padding, but which need the padding to disappear when their content is nil. 
