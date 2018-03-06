
import UIKit

class PrinterUpdateVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var mMakeTextField: UITextField!
    @IBOutlet weak var mModelTextField: UITextField!
    @IBOutlet weak var mTModelTextField: UITextField!
    @IBOutlet weak var mSerialTextField: UITextField!
    @IBOutlet weak var mOwnerTextField: UITextField!
    @IBOutlet weak var mDeptTextField: UITextField!
    @IBOutlet weak var mLocationTextField: UITextField!
    @IBOutlet weak var mFloorTextField: UITextField!
    @IBOutlet weak var mIPTextField: UITextField!
    
    @IBOutlet weak var mStatusPicker: UIPickerView!
    @IBOutlet weak var mColorPicker: UIPickerView!
    
    @IBOutlet weak var mSaveButton: UIButton!
    
    var mSelectedPrinter: Printer?
    
    var mStatusPickerOptions = ["Inactive", "Active"]
    var mColorPickerOptions = ["BW", "Color"]
    
    var mStatus: String?
    var mColor: String?
    
    var mStatusIndex: Int?
    var mColorIndex: Int?
    
    var mDatabase: Database?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mDatabase = Database()
        
        let currentStatus = mSelectedPrinter?.status
        mStatusIndex = mStatusPickerOptions.index(of: currentStatus!)
        
        let currentColor = mSelectedPrinter?.color
        mColorIndex = mColorPickerOptions.index(of: currentColor!)
        
        mMakeTextField.text = mSelectedPrinter?.make
        mModelTextField.text = mSelectedPrinter?.model
        mTModelTextField.text = mSelectedPrinter?.tmodel
        mSerialTextField.text = mSelectedPrinter?.serial
        mSerialTextField.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        mStatusPicker.selectRow(mStatusIndex!, inComponent: 0, animated: true)
        mColorPicker.selectRow(mColorIndex!, inComponent: 0, animated: true)
        mOwnerTextField.text = mSelectedPrinter?.owner
        mDeptTextField.text = mSelectedPrinter?.department
        mLocationTextField.text = mSelectedPrinter?.location
        mFloorTextField.text = mSelectedPrinter?.floor
        mIPTextField.text = mSelectedPrinter?.ip
        
        mMakeTextField.returnKeyType = .done
        mModelTextField.returnKeyType = .done
        mTModelTextField.returnKeyType = .done
        mSerialTextField.returnKeyType = .done
        mOwnerTextField.returnKeyType = .done
        mDeptTextField.returnKeyType = .done
        mLocationTextField.returnKeyType = .done
        mFloorTextField.returnKeyType = .done
        mIPTextField.keyboardType = UIKeyboardType.numberPad
        
        addDoneButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
            
        case 0:
            return mStatusPickerOptions.count
        case 1:
            return mColorPickerOptions.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag {
            
        case 0:
            return "\(mStatusPickerOptions[row])"
        case 1:
            return "\(mColorPickerOptions[row])"
        default:
            return ""
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){

        switch pickerView.tag {

        case 0:
            mStatus = mStatusPickerOptions[row]

        case 1:
            mColor = mColorPickerOptions[row]
            
        default:
            break
        }

    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
            
        case 0:
            mMakeTextField.resignFirstResponder()
            return true
            
        case 1:
            mModelTextField.resignFirstResponder()
            return true
            
        case 2:
            mTModelTextField.resignFirstResponder()
            return true
            
        case 3:
            mSerialTextField.resignFirstResponder()
            return true
            
        case 4:
            mOwnerTextField.resignFirstResponder()
            return true
            
        case 5:
            mDeptTextField.resignFirstResponder()
            return true
            
        case 6:
            mLocationTextField.resignFirstResponder()
            return true
            
        case 7:
            mFloorTextField.resignFirstResponder()
            return true
            
        case 8:
            mIPTextField.resignFirstResponder()
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
            return newLength <= 15
            
        case 1:
            return newLength <= 15
            
        case 2:
            return newLength <= 15
            
        case 3:
            return newLength <= 15
            
        case 4:
            return newLength <= 15
            
        case 5:
            return newLength <= 15
            
        case 6:
            return newLength <= 15
            
        case 7:
            return newLength <= 15
            
        case 8:
            return newLength <= 3 && allowedCharacters.isSuperset(of: characterSet)
            
        default:
            return newLength <= 15
        }
    }
    
    func addDoneButton(){
        let toolbarDone = UIToolbar.init()
        toolbarDone.sizeToFit()
        let barBtnDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(PrinterAddVC.resignmIPTextField))
        
        toolbarDone.items = [barBtnDone]
        mIPTextField.inputAccessoryView = toolbarDone
    }
    
    @objc func resignmIPTextField(){
        mIPTextField.resignFirstResponder()
    }
    
    @IBAction func updatePrinter(){
        
        let make: String = mMakeTextField.text!
        let model: String = mModelTextField.text!
        let tModel: String = mTModelTextField.text!
        let serial: String = mSerialTextField.text!
        let status: String = self.mStatus ?? mStatusPickerOptions[mStatusIndex!]
        let color: String = self.mColor ?? mColorPickerOptions[mColorIndex!]
        let owner: String = mOwnerTextField.text!
        let dept: String = mDeptTextField.text!
        let location: String = mLocationTextField.text!
        let floor: String = mFloorTextField.text!
        let ip: String = mIPTextField.text!
        
        mDatabase?.updatePrinter(id: (mSelectedPrinter?.id)!, make: make, model: model, tmodel: tModel, serial: serial, status: status, color: color, owner: owner, department: dept, location: location, floor: floor, ip: ip)
        
        self.navigationController?.popToRootViewController(animated: true)
    }

}
