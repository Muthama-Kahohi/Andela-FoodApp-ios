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
        self.textColor = .black
        self.backgroundColor = .green
        self.setProperties(borderWidth: 1.0, borderColor: .black)

    }

    func setProperties(borderWidth: Float, borderColor: UIColor) {

        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
    }

}
