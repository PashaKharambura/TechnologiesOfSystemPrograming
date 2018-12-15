import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

protocol SignInViewProtocol: class {
    func startLoading()
    func finishLoading()
    func setUser(user: UserVO)
    func setNoUser()
    func notRegistrated(resp: String)
    func notLogged(resp: String)
    func loggedWithFacebook()
    func logged()
    func registrated()
}

class SignInViewController: BasicViewController, UIGestureRecognizerDelegate {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {didSet{activityIndicator.stopAnimating()}}
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var logInButton: UIButton! { didSet { logInButton.layer.cornerRadius = 10 } }
    
    private let presenter = UserSignInPresenter(auth: AuthModule())
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDataManager().getLevels()
        presenter.attachView(view: self)
    self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        presenter.fetchUser(context: context)
    }
    
    @IBAction func securePasswordViewButton(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    @IBAction func forgotPasswordButtonAction(_ sender: Any) {
    }
    @IBAction func login(_ sender: Any) {
        presenter.loginUserWithEmail(email: emailTextField.text!, password: passwordTextField.text!)
    }
    @IBAction func loginWithFacebook(_ sender: Any) {
        presenter.loginWithFacebook()
    }

}
