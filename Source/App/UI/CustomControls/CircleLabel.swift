import UIKit

@IBDesignable
class CircleLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    override init(frame: CGRect) {

        super.init(frame: frame)
        self.commonInit()
    }


    func commonInit() {

        self.layer.cornerRadius = self.bounds.width/2
        self.clipsToBounds = true
        self.textColor = .white
        self.setProperties(borderWidth: 0.0, borderColor: .white)

    }

    func setProperties(borderWidth: Float, borderColor: UIColor) {

        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
    }

}
