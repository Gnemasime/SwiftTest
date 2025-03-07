import Foundation

// Contact class to represent each contact's details
class Contact {
    var name: String
    var phoneNumber: String
    var email: String
    
    init(name: String, phoneNumber: String, email: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
    }
}

// ContactsManager class to handle contact operations
class ContactsManager {
    private var contacts = [Contact]()
    
    func addContact(name: String, phoneNumber: String, email: String) {
        let newContact = Contact(name: name, phoneNumber: phoneNumber, email: email)
        contacts.append(newContact)
        print("Contact added successfully.")
    }
    
    func viewContacts() {
        if contacts.isEmpty {
            print("No contacts available.")
        } else {
            for contact in contacts {
                print("Name: \(contact.name), Phone: \(contact.phoneNumber), Email: \(contact.email)")
            }
        }
    }
    
    func updateContact(oldName: String, newName: String, newPhoneNumber: String, newEmail: String) {
        if let contact = contacts.first(where: { $0.name == oldName }) {
            contact.name = newName
            contact.phoneNumber = newPhoneNumber
            contact.email = newEmail
            print("Contact updated successfully.")
        } else {
            print("Contact not found.")
        }
    }
    
    func deleteContact(name: String) {
        if let index = contacts.firstIndex(where: { $0.name == name }) {
            contacts.remove(at: index)
            print("Contact deleted successfully.")
        } else {
            print("Contact not found.")
        }
    }
}

func displayMenu() {
    print("\n--- Contacts Management ---")
    print("1. Add Contact")
    print("2. View Contacts")
    print("3. Update Contact")
    print("4. Delete Contact")
    print("5. Exit")
    print("Enter your choice: ", terminator: "")
}

func main() {
    let contactsManager = ContactsManager()
    
    var shouldExit = false
    while !shouldExit {
        displayMenu()
        if let choice = readLine() {
            switch choice {
            case "1":
                print("Enter name: ", terminator: "")
                let name = readLine() ?? ""
                print("Enter phone number: ", terminator: "")
                let phone = readLine() ?? ""
                print("Enter email: ", terminator: "")
                let email = readLine() ?? ""
                contactsManager.addContact(name: name, phoneNumber: phone, email: email)
                
            case "2":
                contactsManager.viewContacts()
                
            case "3":
                print("Enter the name of the contact to update: ", terminator: "")
                let oldName = readLine() ?? ""
                print("Enter new name: ", terminator: "")
                let newName = readLine() ?? ""
                print("Enter new phone number: ", terminator: "")
                let newPhone = readLine() ?? ""
                print("Enter new email: ", terminator: "")
                let newEmail = readLine() ?? ""
                contactsManager.updateContact(oldName: oldName, newName: newName, newPhoneNumber: newPhone, newEmail: newEmail)
                
            case "4":
                print("Enter the name of the contact to delete: ", terminator: "")
                let nameToDelete = readLine() ?? ""
                contactsManager.deleteContact(name: nameToDelete)
                
            case "5":
                shouldExit = true
                print("Exiting...")
                
            default:
                print("Invalid choice. Please try again.")
            }
        }
    }
}

main()
