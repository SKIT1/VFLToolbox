import UIKit
import XCTest
import VFLToolbox

class LayoutGuidesTests: XCTestCase {

    let viewController = UIViewController()
    let view1 = UIView(), view2 = UIView()
    let metric = 1
    var views: [String : AnyObject] = [:]
    var metrics: [String : Int] = [:]
    var topGuide, bottomGuide: UILayoutSupport!

    override func setUp() {
        super.setUp()

        viewController.view.addSubview(view1)
        viewController.view.addSubview(view2)
        views["view1"] = view1
        views["view2"] = view2
        topGuide = viewController.topLayoutGuide
        bottomGuide = viewController.bottomLayoutGuide
        views["topGuide"] = topGuide
        views["bottomGuide"] = bottomGuide
        metrics["metric"] = metric
    }
    
    func testTopGuideSubscript() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[topGuide][view1])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[topGuide][view1]", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    func testBottomGuideSubscript() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1][bottomGuide])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1][bottomGuide]", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    func testTopAndBottomGuidesSubscript() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[topGuide][view1][bottomGuide])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[topGuide][view1][bottomGuide]", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    func testTopGuideMiddleSubscript() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1][topGuide][view2])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1][topGuide][view2]", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    func testBottomGuideConstraintListSubscript() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1][view2][bottomGuide])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1][view2][bottomGuide]", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    func testTopGuideWithConstant() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[topGuide]-(10)-[view1])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[topGuide]-(10)-[view1]", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    func testTopGuideWithMetric() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[topGuide]-(metric)-[view1])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[topGuide]-(metric)-[view1]", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    func testTopGuideWithPredicate() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[topGuide]-(>=metric)-[view1])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[topGuide]-(>=metric)-[view1]", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    func testBottomGuideWithConstant() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1]-(10)-[bottomGuide])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1]-(10)-[bottomGuide]", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    func testBottomGuideWithMetric() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1]-(metric)-[bottomGuide])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1]-(metric)-[bottomGuide]", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    func testBottomGuideWithPredicate() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1]-(<=metric)-[bottomGuide])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1]-(<=metric)-[bottomGuide]", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    func testTopGuideWithPredicateConstraintsList() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[topGuide]-(==metric)-[view1][view2])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[topGuide]-(==metric)-[view1][view2]", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }
    func testBottomGuideWithConstraintsListAndPredicate() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1][view2]-(==metric)-[bottomGuide])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1][view2]-(==metric)-[bottomGuide]", options: [], metrics: metrics, views: views)
        AssertConstraintsEqual(constraints, constraints1: check)
    }

}
