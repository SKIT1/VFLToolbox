import UIKit
import XCTest
import VFLToolbox

class CommonCaseTests: XCTestCase {
    let view1 = UIView(), view2 = UIView(), superview = UIView()
    let margin: CGFloat = 8
    var views: [String : UIView] = [:]
    var metrics: [String : CGFloat] = [:]
    
    override func setUp() {
        superview.addSubview(view1)
        superview.addSubview(view2)
        views["view1"] = view1
        views["view2"] = view2
        metrics["margin"] = margin
    }
    
    func testHorizontalLeadingTrailingSuperviewWithView() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:|[view1]|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:|[view1]|", options: [], metrics: nil, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    
    func testVerticalTopBottomSuperviewWithView() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:|[view1]|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:|[view1]|", options: [], metrics: nil, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    
    func testHorizontalLeadingTrailingSuperviewWithViewAndMargin() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:|-margin-[view1]-margin-|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[view1]-margin-|", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    
    func testVerticalTopBottomSuperviewWithViewAndMargin() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:|-margin-[view1]-margin-|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:|-margin-[view1]-margin-|", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    
    func testHorizontalLeadingTrailingSuperviewWithConstraintList() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:|[view1][view2]|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:|[view1][view2]|", options: [], metrics: nil, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    
    func testVerticalTopBottomSuperviewWithConstraintList() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:|[view1][view2]|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:|[view1][view2]|", options: [], metrics: nil, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    
    func testHorizontalLeadingTrailingSuperviewWithConstraintListAndMargin() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:|-margin-[view1][view2]-margin-|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[view1][view2]-margin-|", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    
    func testVerticalTopBottomSuperviewWithConstraintListAndMargin() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:|-margin-[view1][view2]-margin-|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:|-margin-[view1][view2]-margin-|", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    
    func testHorizontalLeadingTrailingSuperviewWithConstraintListAndInBetweenMargin() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:|-margin-[view1]-margin-[view2]-margin-|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[view1]-margin-[view2]-margin-|", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    
    func testVerticalTopBottomSuperviewWithConstraintListAndInBetweenMargin() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:|-margin-[view1]-margin-[view2]-margin-|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:|-margin-[view1]-margin-[view2]-margin-|", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    
}
