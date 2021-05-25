//
//  NibView.swift
//  StatusView
//
//  Created by Scott Lydon on 5/24/21.
//

#if os(iOS)
import UIKit

@IBDesignable
public class NibView: UIView {
    var view: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
    }

    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        view.prepareForInterfaceBuilder()
    }
}

extension UIView {

    var nib: UINib {
        UINib(
            nibName: type(of: self).description().components(separatedBy: ".").last!,
            bundle: Bundle(for: type(of: self))
        )
    }

    var nibView: UIView {
        nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}


public extension NibView {

    func xibSetup() {

        backgroundColor = .clear
        view = nibView

        // prevents offsetting.
        view.bounds = bounds

        // add subview
        addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: topAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        } else {
            addConstraints(
                NSLayoutConstraint.constraints(
                    withVisualFormat: "H:|[childView]|",
                    options: [],
                    metrics: nil,
                    views: ["childView": view as Any]
                )
            )
            addConstraints(
                NSLayoutConstraint.constraints(
                    withVisualFormat: "V:|[childView]|",
                    options: [],
                    metrics: nil,
                    views: ["childView": view as Any]
                )
            )
        }
    }
}
#endif
