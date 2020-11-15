//
//  LoginViewController.swift
//  Twitter
//
//  Created by Renu Bandaru on 11/6/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //we want to check if the user default is set for the specific key userLoggedIn
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true
        {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        
        //getting the api from the authrntication -> request token in twitter api google search
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        //calling the client to log in
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            //entering user default - allows the system to remember the user is logged in
            //anytime someone logs in, it is going to create a variable called user logged in and set the value to true - that way next time you log in, the app should look at that variable first & check wherethere there is a user logged in variable is true and if yes, the user is sent to the home screen right away
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            self.performSegue(withIdentifier: "loginToHome", sender: self) //logintohome is the segue from the login screen to navigation (2nd screen)
        }, failure: { (Error) in
            print("Could not log in") //prints when there is an error and fails to log in
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
