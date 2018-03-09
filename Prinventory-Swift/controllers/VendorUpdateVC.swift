
import UIKit

class VendorUpdateVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var mIconImage: UIImageView!
    
    @IBOutlet weak var mNameTextField: UITextField!
    @IBOutlet weak var mPhoneTextField: UITextField!
    @IBOutlet weak var mEmailTextField: UITextField!
    @IBOutlet weak var mStreetTextField: UITextField!
    @IBOutlet weak var mCityTextField: UITextField!
    @IBOutlet weak var mZipcodeTextField: UITextField!
    
    @IBOutlet weak var mStatePicker: UIPickerView!
    
    @IBOutlet weak var mSaveButton: UIButton!
    
    var mStatePickerOptions = ["AK", "AL", "AR", "AS", "AZ","CA", "CO","CT", "DC", "DE", "FL",
                              "GA", "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA",
                              "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH",
                              "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC",
                              "SD", "TN", "TX", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"]
    
    var mState: String?
    var mStateIndex: Int?
    
    var mDatabase: Database?
    
    var mSelectedVendor: Vendor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mDatabase = Database()
        
        let currentState = mSelectedVendor?.state
        mStateIndex = mStatePickerOptions.index(of: currentState!)
        
        mNameTextField.text = mSelectedVendor?.name
        mPhoneTextField.text = mSelectedVendor?.phone
        mEmailTextField.text = mSelectedVendor?.email
        mStreetTextField.text = mSelectedVendor?.street
        mCityTextField.text = mSelectedVendor?.city
        mStatePicker.selectRow(mStateIndex!, inComponent: 0, animated: true)
        mZipcodeTextField.text = mSelectedVendor?.zipcode
        
        mNameTextField.returnKeyType = .done
        mPhoneTextField.returnKeyType = .done
        mPhoneTextField.keyboardType = UIKeyboardType.numberPad
        mEmailTextField.returnKeyType = .done
        mEmailTextField.keyboardType = UIKeyboardType.emailAddress
        mStreetTextField.returnKeyType = .done
        mCityTextField.returnKeyType = .done
        mZipcodeTextField.keyboardType = UIKeyboardType.numberPad
        mZipcodeTextField.returnKeyType = .done
        
        addDoneButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return mStatePickerOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(mStatePickerOptions[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        mState = mStatePickerOptions[row]
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
            
        case 0:
            mNameTextField.resignFirstResponder()
            return true
            
        case 1:
            mPhoneTextField.resignFirstResponder()
            return true
            
        case 2:
            mEmailTextField.resignFirstResponder()
            return true
            
        case 3:
            mCityTextField.resignFirstResponder()
            return true
            
        case 4:
            mStreetTextField.resignFirstResponder()
            return true
            
        case 5:
            mZipcodeTextField.resignFirstResponder()
            return true
            
        default:
            return true
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        guard let text = textField.text else { return true }
        
        let newLength = text.count + string.count - range.length
        
        switch textField.tag {
            
        case 0:
            return newLength <= 25
            
        case 1:
            return newLength <= 10 && allowedCharacters.isSuperset(of: characterSet)
            
        case 2:
            return newLength <= 20
            
        case 3:
            return newLength <= 30
            
        case 4:
            return newLength <= 20
            
        case 5:
            return newLength <= 5 && allowedCharacters.isSuperset(of: characterSet)
            
            
        default:
            return newLength <= 20
        }
    }
    
    func addDoneButton(){
        let toolbarDone = UIToolbar.init()
        toolbarDone.sizeToFit()
        let barBtnDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(VendorUpdateVC.resignTextFields))
        
        toolbarDone.items = [barBtnDone]
        
        mPhoneTextField.inputAccessoryView = toolbarDone
        mZipcodeTextField.inputAccessoryView = toolbarDone
    }
    
    @objc func resignTextFields(){
        mPhoneTextField.resignFirstResponder()
        mZipcodeTextField.resignFirstResponder()
    }
    
    @IBAction func updateVendor(){
        
        let name: String = mNameTextField.text!
        let phone: String = mPhoneTextField.text!
        let email: String = mEmailTextField.text!
        let street: String = mStreetTextField.text!
        let city: String = mCityTextField.text!
        let state: String = mState ?? mStatePickerOptions[mStateIndex!]
        let zipcode: String = mZipcodeTextField.text!
        
        mDatabase?.updateVendor(id: (mSelectedVendor?.id)!, name: name, phone: phone, email: email, street: street, city: city, state: state, zipcode: zipcode)

        self.navigationController?.popToRootViewController(animated: true)
    }

}
