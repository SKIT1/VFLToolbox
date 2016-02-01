import UIKit

extension UIView {

    public func addConstraints(H H: [VFLConstraint]) {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H: H)
        self.addConstraints(constraints)
    }
    public func addConstraints(V V: [VFLConstraint]) {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V: V)
        self.addConstraints(constraints)
    }

}
