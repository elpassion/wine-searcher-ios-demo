import UIKit

class SearchViewController: UIViewController {

    var searchView: SearchView! {
        return view as? SearchView
    }

    override func loadView() {
        view = SearchView()
    }

}
