//
//  ThirdViewController.swift
//  Ndela054-UPEApp
//
//  Created by user175850 on 7/31/20.
//  Copyright © 2020 user175850. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UITextFieldDelegate {
    
    // Implementing Model
    let myContacts = ContactDB.sharedInstance
    var currentContact = Contact(name:"",email:"")
    
    // Outlet text fields
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    // Override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentContact = myContacts.nextContact()
        nameTextField.text = currentContact.name
        emailTextField.text = currentContact.email
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // New contact
    @IBAction func newButtonPressed(_ sender: UIButton)
    {
        //print("new was pressed")
        if !validateInput()
        {
            return
        }
        
        // I could not figure out how to make the fields empty out on their own,
        // But once you clear them, put in the new info and click new
        // A new contact will be created
        let nameString: String? = nameTextField.text
        let emailString: String? = emailTextField.text
        if let tempName = nameString
        {
            if let tempEmail = emailString
            {
                if tempName == currentContact.name
                {
                    if tempEmail == currentContact.email
                    {
                        let redCol = UIColor.red
                        nameTextField.layer.borderColor = redCol.cgColor
                        nameTextField.layer.borderWidth = 1.0
                        emailTextField.layer.borderColor = redCol.cgColor
                        emailTextField.layer.borderWidth = 1.0
                        return
                    }
                }
                let newContact: Contact = Contact(name: tempName, email: tempEmail )
                myContacts.addContact(new: newContact)
            }
        }
        
    }
    
    // Update current contact
    @IBAction func updateButtonPressed(_ sender: UIButton)
    {
        //print("update was pressed")
        if !validateInput()
        {
            return
        }
        let nameString: String? = nameTextField.text
        let emailString: String? = emailTextField.text
        if let tempName = nameString
        {
            if let tempEmail = emailString
            {
                currentContact = Contact(name: tempName, email: tempEmail )
                myContacts.updateContact(modified: currentContact)
            }
        }
        
        
    }
    
    // Next button
    @IBAction func nextButtonPressed(_ sender: UIButton)
    {
        //print("next was pressed")
        currentContact = myContacts.nextContact()
        nameTextField.text = currentContact.name
        emailTextField.text = currentContact.email
        emailTextField.layer.borderWidth = 0
        nameTextField.layer.borderWidth = 0
        
    }
    
    // Previous button
    @IBAction func prevButtonPressed(_ sender: UIButton)
    {
        //print("prev was pressed")
        currentContact = myContacts.prevContact()
        nameTextField.text = currentContact.name
        emailTextField.text = currentContact.email
        emailTextField.layer.borderWidth = 0
        nameTextField.layer.borderWidth = 0
    }
    
    // Text field functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        //print("ShouldReturnFired")
        if validateInput()
        {
            textField.resignFirstResponder()
        }
        
        return true
        
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        //print("ShouldBeginFired")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if validateInput()
        {
            
        }
        
    }
    
    // Input validation
    func validateInput() -> Bool
    {
        var validName = false
        var validEmail = false
        
        // Red color for invalid input
        let redCol = UIColor.red
        emailTextField.layer.borderWidth = 0
        nameTextField.layer.borderWidth = 0
        
        if let tempName = nameTextField.text
        {
            if let tempEmail = emailTextField.text
            {
                if tempName != ""
                {
                    validName = true
                    
                }
                else
                {
                    nameTextField.layer.borderColor = redCol.cgColor
                    nameTextField.layer.borderWidth = 1.0
                }
                if tempEmail != ""
                {
                    validEmail = true
                }
                else
                {
                    emailTextField.layer.borderColor = redCol.cgColor
                    emailTextField.layer.borderWidth = 1.0
                }
                
            }
        }
        return validName && validEmail
    }
}
