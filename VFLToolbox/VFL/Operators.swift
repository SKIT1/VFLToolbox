import UIKit

prefix operator | {}
prefix operator |- {}

postfix operator -| {}
postfix operator | {}

public prefix func |(view: [UIView]) -> [VFLConstraint] {
    if view.count == 0 {
        assert(false, "You should specify a view")
    }

    let superview = Superview(mode: .Head)
    let constraint = SuperviewConstraint(superview: superview, view: view.first!)
    return [constraint]
}

public prefix func |(constraints: [VFLConstraint]) -> [VFLConstraint] {
    var constraints = constraints
    if constraints.count == 0 {
        return []
    }

    let superview = Superview(mode: .Head)
    let constraint = SuperviewConstraint(superview: superview, view: constraints.first!.source as! UIView)
    constraints.insert(constraint, atIndex: 0)
    return constraints
}

public prefix func |-(predicatable: Predicatable) -> Superview {
    return Superview(mode: .Head, predicate: PredicatableMakePredicate(predicatable))
}

public postfix func -|(predicatable: Predicatable) -> Superview {
    return Superview(mode: .Tail, predicate: PredicatableMakePredicate(predicatable))
}

public postfix func |(view: [UIView]) -> [VFLConstraint] {
    if view.count == 0 {
        assert(false, "You should specify a view")
    }

    let superview = Superview(mode: .Tail)
    let constraint = SuperviewConstraint(superview: superview, view: view.first!)
    return [constraint]
}

public postfix func |(constraints: [VFLConstraint]) -> [VFLConstraint] {
    var constraints = constraints
    if constraints.count == 0 {
        return []
    }

    let superview = Superview(mode: .Tail)
    let constraint = SuperviewConstraint(superview: superview, view: constraints.last!.target as! UIView)
    constraints.append(constraint)
    return constraints
}

public func -(superview: Superview, view: [UIView]) -> [VFLConstraint] {
    if view.count == 0 {
        assert(false, "You should specify a view")
    }

    let constraint = SuperviewConstraint(superview: superview, view: view.first!)
    return [constraint]
}

public func -(superview: Superview, constraints: [VFLConstraint]) -> [VFLConstraint] {
    var constraints = constraints
    if constraints.count == 0 {
        return []
    }

    let constraint = SuperviewConstraint(superview: superview, view: constraints.first!.source as! UIView)
    constraints.insert(constraint, atIndex: 0)
    return constraints
}

public func -(view: [UIView], superview: Superview) -> [VFLConstraint] {
    if view.count == 0 {
        assert(false, "You should specify a view")
    }
    let constraint = SuperviewConstraint(superview: superview, view: view.first!)
    return [constraint]
}

public func -(constraints: [VFLConstraint], superview: Superview) -> [VFLConstraint] {
    var constraints = constraints
    if constraints.count == 0 {
         return []
    }

    let constraint = SuperviewConstraint(superview: superview, view: constraints.last!.target as! UIView)
    constraints.append(constraint)
    return constraints
}

public func -(view: [UIView], predicatable: Predicatable) -> Sibling {
    if view.count == 0 {
        assert(false, "You should specify a view")
    }
    return Sibling(item: view.first!, predicate: PredicatableMakePredicate(predicatable))
}

public func -(view: [UILayoutSupport], predicatable: Predicatable) -> Sibling {
    if view.count == 0 {
        assert(false, "You should specify a view")
    }
    return Sibling(item: view.first!, predicate: PredicatableMakePredicate(predicatable))
}

public func -(constraints: [VFLConstraint], predicatable: Predicatable) -> ([VFLConstraint], Sibling) {
    let sibling = Sibling(item: constraints.last!.target, predicate: PredicatableMakePredicate(predicatable))
    return (constraints, sibling)
}

public func -(sibling: Sibling, view: [UIView]) -> [VFLConstraint] {
    if view.count == 0 {
        assert(false, "You should specify a view")
    }
    let constraint = SiblingConstraint(sibling: sibling, item: view.first!)
    return [constraint]
}

public func -(sibling: Sibling, view: [UILayoutSupport]) -> [VFLConstraint] {
    if view.count == 0 {
        assert(false, "You should specify a view")
    }
    let constraint = SiblingConstraint(sibling: sibling, item: view.first!)
    return [constraint]
}

public func -(sibling: Sibling, constraints: [VFLConstraint]) -> [VFLConstraint] {
    var constraints = constraints
    if constraints.count == 0 {
        return []
    }
    let constraint = SiblingConstraint(sibling: sibling, item: constraints.first!.source)
    constraints.insert(constraint, atIndex: 0)
    return constraints
}

public func -( partial: ([VFLConstraint], Sibling), view: [UIView]) -> [VFLConstraint] {
    var partial = partial
    if view.count == 0 {
        assert(false, "You should specify a view")
    }
    let constraint = SiblingConstraint(sibling: partial.1, item: view.first!)
    partial.0.append(constraint)
    return partial.0
}

public func -(partial: ([VFLConstraint], Sibling), view: [UILayoutSupport]) -> [VFLConstraint] {
    var partial = partial
    if view.count == 0 {
        assert(false, "You should specify a view")
    }
    let constraint = SiblingConstraint(sibling: partial.1, item: view.first!)
    partial.0.append(constraint)
    return partial.0
}

public func -(partial: ([VFLConstraint], Sibling), constraints: [VFLConstraint]) -> [VFLConstraint] {
    let constraint = SiblingConstraint(sibling: partial.1, item: constraints.first!.source)
    var result = partial.0
    result.append(constraint)
    result.appendContentsOf(constraints)
    return result
}
