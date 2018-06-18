import UIKit
import RxCocoa
import RxSwift

class CreateViewController: UIViewController {

    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        label.font = label.font.withSize(label.frame.height )
        textField.rx.text.bind { [label] in label?.text = $0 }
        .disposed(by: disposeBag)
    }

    @IBAction func createButtonClicked(_ sender: UIButton) {
        let picture = wrapperView.snapshot()
        performSegue(withIdentifier: "showCreated", sender: picture)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? CreatedViewController, let picture = sender as? UIImage {
            nextVC.picture = picture
        }
    }

}

extension UIView {
    
    func snapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, UIScreen.main.scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}

