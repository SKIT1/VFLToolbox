import UIKit
import XCTest

func AssertConstraintsEqual(constraints0: [NSLayoutConstraint], constraints1: [AnyObject], file: String = #file, line: UInt = #line) {
    XCTAssertEqual(constraints0.count, constraints1.count, "Should have equal constraints count")
    let count = min(constraints0.count, constraints1.count)
    for i in 0..<count {
        let index = (i+1) % 10 == 1 ? "\(i+1)st" : "\(i+1)nd"
        let constraint = constraints0[i], check = constraints1[i] as! NSLayoutConstraint
        XCTAssertEqual(constraint.firstItem as? UIView, check.firstItem as? UIView, "First item should be properly set for the \(index) constraint\n")
        XCTAssertEqual(constraint.firstAttribute, check.firstAttribute, "First attribute should be properly set for the \(index) constraint\n")
        XCTAssertEqual(constraint.secondItem as? UIView, check.secondItem as? UIView, "Second item should be properly set for the \(index) constraint\n")
        XCTAssertEqual(constraint.secondAttribute, check.secondAttribute, "Second attribute should be properly set for the \(index) constraint\n")
        XCTAssertEqual(constraint.relation, check.relation, "Relation should be properly set for the \(index) constraint\n")
        XCTAssertEqual(constraint.multiplier, check.multiplier, "Multiplier should be properly set for the \(index) constraint\n")
        XCTAssertEqual(constraint.constant, check.constant, "Constant should be properly set for the \(index) constraint\n")
    }
}
