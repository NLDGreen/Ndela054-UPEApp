// PROGRAMMER:  Nicholas Delamo
// PANTHERID:   5278993
// CLASS:       COP 465501 Online
// INSTRUCTOR:  Steve Luis ECS 282
// ASSIGNMENT:  Solo Project
// DUE:         Monday 08/03/20
//

import UIKit

class ContactViewController: UIViewController, UITextFieldDelegate {
    
    // Implementing Model
    let myContacts = ContactDB.sharedInstance
    var currentContact = Contact(name:"",email:"",phoneNumber:"",role:"")
    
    // Outlet text fields
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneNumberField: UITextField!
    @IBOutlet var roleTextField: UITextField!
    
    // Override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentContact = myContacts.nextContact()
        nameTextField.text = currentContact.name
        emailTextField.text = currentContact.email
        phoneNumberField.text = currentContact.phoneNumber
        roleTextField.text = currentContact.role
        
        
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
        
        let nameString: String? = nameTextField.text
        let emailString: String? = emailTextField.text
        let phoneString: String? = phoneNumberField.text
        let roleString: String? = roleTextField.text
        if let tempName = nameString
        {
            if let tempEmail = emailString
            {
                if let tempPhone = phoneString
                {
                    if let tempRole = roleString
                    {
                        if tempName == currentContact.name
                        {
                            if tempEmail == currentContact.email
                            {
                                if tempPhone == currentContact.phoneNumber
                                {
                                    if tempRole == currentContact.role
                                    {
                                        let redCol = UIColor.red
                                        nameTextField.layer.borderColor = redCol.cgColor
                                        nameTextField.layer.borderWidth = 1.0
                                        emailTextField.layer.borderColor = redCol.cgColor
                                        emailTextField.layer.borderWidth = 1.0
                                        phoneNumberField.layer.borderColor = redCol.cgColor
                                        phoneNumberField.layer.borderWidth = 1.0
                                        roleTextField.layer.borderColor = redCol.cgColor
                                        roleTextField.layer.borderWidth = 1.0
                                        return
                                    }
                                }
                            }
                        }
                        let newContact: Contact = Contact(name: tempName, email: tempEmail, phoneNumber: tempPhone, role: tempRole )
                        myContacts.addContact(new: newContact)
                    }
                }
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
        let phoneString: String? = phoneNumberField.text
        let roleString: String? = roleTextField.text
        if let tempName = nameString
        {
            if let tempEmail = emailString
            {
                if let tempPhone = phoneString
                {
                    if let tempRole = roleString
                    {
                        currentContact = Contact(name: tempName, email: tempEmail, phoneNumber: tempPhone, role: tempRole )
                        myContacts.updateContact(modified: currentContact)
                    }
                }
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
        phoneNumberField.text = currentContact.phoneNumber
        roleTextField.text = currentContact.role
        emailTextField.layer.borderWidth = 0
        nameTextField.layer.borderWidth = 0
        phoneNumberField.layer.borderWidth = 0
        roleTextField.layer.borderWidth = 0
        
    }
    
    // Previous button
    @IBAction func prevButtonPressed(_ sender: UIButton)
    {
        //print("prev was pressed")
        currentContact = myContacts.prevContact()
        nameTextField.text = currentContact.name
        emailTextField.text = currentContact.email
        phoneNumberField.text = currentContact.phoneNumber
        roleTextField.text = currentContact.role
        emailTextField.layer.borderWidth = 0
        nameTextField.layer.borderWidth = 0
        phoneNumberField.layer.borderWidth = 0
        roleTextField.layer.borderWidth = 0
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
