
import UIKit

@IBDesignable class RatingControl: UIStackView {

    //MARK: Properties
    var rating = 0 {

        didSet {
            updateButtonSelectionStates()
        }
    }
    private var ratingButtons = [UIButton]()

    @IBInspectable var starCount: Int = 5 {

        didSet {

            setupButtons()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {

        didSet {

            setupButtons()
        }
    }

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupButtons()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)

        setupButtons()
    }

    // MARK: Private Methods
    @objc func ratingButtonTapped(button: UIButton) {

        guard let index = ratingButtons.index(of: button) else { return }

        // Calculate the rating of the selected button
        let selectedRating = index + 1

        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }

    private func setupButtons() {

        // clear any existing buttons
        for button in ratingButtons {

            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()

        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)

        for _ in 0..<5 {

            let button = UIButton()
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.shadowOpacity = 0.8

            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])

            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true

            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            addArrangedSubview(button)

            ratingButtons.append(button)
        }

        updateButtonSelectionStates()
    }

    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {

            button.isSelected = index < rating
        }
    }
}
