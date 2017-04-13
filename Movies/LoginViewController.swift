//
//  ViewController.swift
//  Movies
//
//  Created by Guilherme Trilha on 29/03/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //MARK: TextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        if textField === loginTextField {
            updateLoginButtonState()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        updateLoginButtonState()
        
        if textField === loginTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField === passwordTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateLoginButtonState()
    }

    //MARK: Actions
    
    @IBAction func onLogin(_ sender: UIButton) {
        onLogin(login: getLoginFromTextFields())
    }
    
    //MARK: Private Methods
    
    private func updateLoginButtonState() {
        let login = getLoginFromTextFields()
        loginButton.isEnabled = !login.userName.isEmpty && !login.password.isEmpty
    }
    
    private func getLoginFromTextFields() -> (userName: String, password: String){
        let userNameText = loginTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""
        return (userName: userNameText, password: passwordText)
    }
    
    
    private func onLogin(login: (userName: String, password: String)){
        if validate(login: login){
            authenticateUser(login: login)
        }else{
            print("Invalid credentials")
        }
        
    }
    
    private func validate(login: (userName: String, password: String)) -> Bool{
        let userNameValid = !login.userName.isEmpty
        let passwordValid = !login.password.isEmpty
        return userNameValid && passwordValid
        
    }
    
    private func authenticateUser(login: (userName: String, password: String)){
        let requestParameters : Parameters = [
            "userName" : login.userName,
            "password" : login.password
        ]
        let requestUrl = "http://localhost:8080/register"
        
        Alamofire.request(requestUrl, method: .post, parameters: requestParameters, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success:
                self.onUserAuthenticatedSucess(resultValue: response.result.value)
                    //TODO sucess
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func onUserAuthenticatedSucess(resultValue: Any?){
        guard let json = resultValue as? [String: AnyObject] else {
            print("Didn`t get User Object as JSON from API")
            return
        }
        
        guard let user = User(json: json) else{
            print("Couldn`t create User object from JSON")
            return
        }
        delegate.user = user
        navigateToMoviesList()
    }
    
    private func navigateToMoviesList(){
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MovieListNavigationView") as! UINavigationController
        self.present(nextViewController, animated: true)
    }


}

