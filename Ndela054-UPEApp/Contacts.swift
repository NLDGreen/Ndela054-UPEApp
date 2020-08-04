// PROGRAMMER:  Nicholas Delamo
// PANTHERID:   5278993
// CLASS:       COP 465501 Online
// INSTRUCTOR:  Steve Luis ECS 282
// ASSIGNMENT:  Solo Project
// DUE:         Monday 08/03/20
//

// Structure for contacts
struct Contact
{
    var name: String
    var email: String
    var phoneNumber: String?
    var role: String
}

// Protected database
final class ContactDB
{
    static let sharedInstance = ContactDB()
    
    private var contactList: [Contact] = [Contact(name: "Matt Taylor", email: "", phoneNumber: "", role: "President"),
                                          Contact(name: "Carlos Neira",email: "", phoneNumber: "", role: "Vice President")]
    
    var displayIndex = -1
    
    private init()
    {
        sort()
    }
    
    func nextContact() -> Contact
    {
        // Increment display index
        displayIndex += 1
        
        // Test for wrap condition
        if displayIndex >= contactList.count
        {
            displayIndex = 0
        }
        
        // Return contact index
        return contactList[displayIndex]
    }
    
    func prevContact() -> Contact
    {
        // Decrement display index
        displayIndex -= 1
        
        // Test for wrap condition
        if displayIndex < 0
        {
            displayIndex = contactList.count-1
        }
        
        // Return contact at index
        return contactList[displayIndex]
    }
    
    func updateContact(modified: Contact)
    {
        // Replace Contact info at displayIndex with modified
        
        contactList[displayIndex] = modified
        
        sort()
    }
    
    func addContact(new: Contact)
    {
        // Append new to contactList
        contactList.append(new)
        
        sort()
    }
    
    private func sort()
    {
        contactList.sort(by: { $0.name < $1.name})
    }
}
