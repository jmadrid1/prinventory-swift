
import UIKit

class VendorAddVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var mIconImage: UIImageView!
    
    @IBOutlet weak var mNameLabel: UILabel!
    @IBOutlet weak var mPhoneLabel: UILabel!
    @IBOutlet weak var mEmailLabel: UILabel!
    @IBOutlet weak var mStreetLabel: UILabel!
    @IBOutlet weak var mCityLabel: UILabel!
    @IBOutlet weak var mStateLabel: UILabel!
    @IBOutlet weak var mZipcodeLabel: UILabel!
    
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
    
    var mDatabase: Database?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mDatabase = Database()
        
        mIconImage.image = UIImage(named: "ic_vendor.png")
        
        mNameLabel.text = "Name:"
        mPhoneLabel.text = "Phone:"
        mEmailLabel.text = "Email:"
        mStreetLabel.text = "Street:"
        mCityLabel.text = "City:"
        mStateLabel.text = "State:"
        mZipcodeLabel.text = "Zipcode:"
        
        mNameLabel.font = UIFont.systemFont(ofSize: 14)
        mPhoneLabel.font = UIFont.systemFont(ofSize: 14)
        mEmailLabel.font = UIFont.systemFont(ofSize: 14)
        mStreetLabel.font = UIFont.systemFont(ofSize: 14)
        mCityLabel.font = UIFont.systemFont(ofSize: 14)
        mStateLabel.font = UIFont.systemFont(ofSize: 14)
        mZipcodeLabel.font = UIFont.systemFont(ofSize: 14)
        
        mNameTextField.tag = 0
        mPhoneTextField.tag = 1
        mEmailTextField.tag = 2
        mStreetTextField.tag = 3
        mCityTextField.tag = 4
        mZipcodeTextField.tag = 5
   
        mNameTextField.placeholder = "Enter Make"
        mPhoneTextField.placeholder = "XXX-XXX-XXXX"
        mEmailTextField.placeholder = "Enter Email"
        mStreetTextField.placeholder = "Enter Street"
        mCityTextField.placeholder = "Enter City"
        mZipcodeTextField.placeholder = "Enter Zipcode"

        mNameTextField.returnKeyType = .done
        mPhoneTextField.returnKeyType = .done
        mEmailTextField.returnKeyType = .done
        mEmailTextField.keyboardType = UIKeyboardType.emailAddress
        mStreetTextField.returnKeyType = .done
        mCityTextField.returnKeyType = .done
        mZipcodeTextField.keyboardType = UIKeyboardType.numberPad
        mZipcodeTextField.returnKeyType = .done
        
        mNameTextField.autocapitalizationType = UITextAutocapitalizationType.words
        mPhoneTextField.keyboardType = UIKeyboardType.numberPad
        mEmailTextField.autocapitalizationType = UITextAutocapitalizationType.words
        mStreetTextField.autocapitalizationType = UITextAutocapitalizationType.words
        mCityTextField.autocapitalizationType = UITextAutocapitalizationType.words
  
        addDoneButton()
        
        mSaveButton.titleLabel?.text = "Save"
        
        mIconImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-125)
            make.centerY.equalToSuperview().inset(-130)
            make.height.equalTo(104)
            make.width.equalTo(102)
        }
        
        mNameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview().offset(-156)
            make.width.equalTo(42)
            make.height.equalTo(17)
        }
        
        mPhoneLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview().offset(-102)
            make.width.equalTo(45)
            make.height.equalTo(17)
        }
        
        mEmailLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-48)
            make.centerY.equalToSuperview().offset(-52)
            make.width.equalTo(53)
            make.height.equalTo(17)
        }
        
        mStreetLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-43)
            make.centerY.equalToSuperview()
            make.width.equalTo(44)
            make.height.equalTo(17)
        }
        
        mCityLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-145)
            make.centerY.equalToSuperview().offset(50)
            make.width.equalTo(46)
            make.height.equalTo(17)
        }
        
        mStateLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(15)
            make.centerY.equalToSuperview().offset(50)
            make.width.equalTo(39)
            make.height.equalTo(17)
        }
        
        mZipcodeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-33)
            make.centerY.equalToSuperview().offset(100)
            make.width.equalTo(57)
            make.height.equalTo(17)
        }
        
        mNameTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(90)
            make.centerY.equalToSuperview().offset(-156)
            make.width.equalTo(160)
            make.height.equalTo(30)
        }
        
        mPhoneTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(90)
            make.centerY.equalToSuperview().offset(-102)
            make.width.equalTo(160)
            make.height.equalTo(30)
        }
        
        mEmailTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(70)
            make.centerY.equalToSuperview().offset(-52)
            make.width.equalTo(199)
            make.height.equalTo(30)
        }
        
        mStreetTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview()
            make.width.equalTo(199)
            make.height.equalTo(30)
        }
        
        mCityTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-75)
            make.centerY.equalToSuperview().offset(50)
            make.width.equalTo(109)
            make.height.equalTo(30)
        }
        
        mStatePicker.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(105)
            make.centerY.equalToSuperview().offset(50)
            make.width.equalTo(122)
            make.height.equalTo(38)
        }
        
        mZipcodeTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(89)
            make.centerY.equalToSuperview().offset(100)
            make.width.equalTo(174)
            make.height.equalTo(30)
        }
        
        mSaveButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(220)
            make.width.equalTo(34)
            make.height.equalTo(30)
        }
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
    
    /**
     Limits the amount of characters for the specified TextFields and makes specific Textfields input strictly numeric
     */
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
            return newLength <= 30
            
        case 3:
            return newLength <= 20
            
        case 4:
            return newLength <= 20
            
        case 5:
            return newLength <= 5 && allowedCharacters.isSuperset(of: characterSet)
       
        default:
            return newLength <= 20
        }
    }
    
    /**
     Attaches a "Done" UIBarButtonItem to TextFields that are strictly numeric
     */
    func addDoneButton(){
        let toolbarDone = UIToolbar.init()
        toolbarDone.sizeToFit()
        let barBtnDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(VendorAddVC.resignTextFields))
        
        toolbarDone.items = [barBtnDone]
        
        mPhoneTextField.inputAccessoryView = toolbarDone
        mZipcodeTextField.inputAccessoryView = toolbarDone
    }
    
    /**
     Resigns the First Responsder of the Textfields
     */
    @objc func resignTextFields(){
        mPhoneTextField.resignFirstResponder()
        mZipcodeTextField.resignFirstResponder()
    }
    
    /**
     Saves vendor to the SQLite Database based off of input from TextField & UIPickerView
     */
    @IBAction func addVendor(){
        
        let name: String = mNameTextField.text!
        let phone: String = mPhoneTextField.text!
        let email: String = mEmailTextField.text!
        let street: String = mStreetTextField.text!
        let city: String = mCityTextField.text!
        let state: String = mState ?? mStatePickerOptions[0]
        let zipcode: String = mZipcodeTextField.text!
        
        mDatabase?.addVendor(name: name, phone: phone, email: email, street: street, city: city, state: state, zipcode: zipcode)

        self.navigationController?.popViewController(animated: true)
    }

}
