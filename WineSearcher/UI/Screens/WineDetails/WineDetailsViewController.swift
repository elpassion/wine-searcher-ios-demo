import UIKit

class WineDetailsViewController: UIViewController {

    init(inputs: WineDetailsInputs) {
        self.inputs = inputs
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
    }

    var wineDetailsView: WineDetailsView! {
        return view as? WineDetailsView
    }

    override func loadView() {
        view = WineDetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupActions()
    }

    // MARK: - Private

    private let inputs: WineDetailsInputs

    private func setupView() {
        wineDetailsView.wineImageView.image = inputs.wineImage
        wineDetailsView.wineDetailsDescriptionView.titleLabel.text = inputs.wineName
    }

    private func setupActions() {
        wineDetailsView.transparentView.touchUpInsideAction = { [weak self] in self?.dismissSelf() }
    }

    @objc
    private func dismissSelf() {
        dismiss(animated: true)
    }

    // MARK: - Required

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
