import UIKit

class CreatedViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var picture: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = picture
    }
}
