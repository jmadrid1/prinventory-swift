
import UIKit

class PrinterUpdateVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var mIconImage: UIImageView!
    
    @IBOutlet weak var mMakeLabel: UILabel!
    @IBOutlet weak var mModelLabel: UILabel!
    @IBOutlet weak var mTModelLabel: UILabel!
    @IBOutlet weak var mSerialLabel: UILabel!
    @IBOutlet weak var mStatusLabel: UILabel!
    @IBOutlet weak var mColorLabel: UILabel!
    @IBOutlet weak var mOwnerLabel: UILabel!
    @IBOutlet weak var mDeptLabel: UILabel!
    @IBOutlet weak var mLocationLabel: UILabel!
    @IBOutlet weak var mFloorLabel: UILabel!
    @IBOutlet weak var mIpLabel: UILabel!

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
        
        mIconImage.image = UIImage(named: "ic_printer.png")
        
        mMakeLabel.text = "Make:"
        mModelLabel.text = "Model:"
        mTModelLabel.text = "TModel:"
        mSerialLabel.text = "Serial:"
        mStatusLabel.text = "Status:"
        mColorLabel.text = "Color:"
        mOwnerLabel.text = "Owner:"
        mDeptLabel.text = "Department:"
        mLocationLabel.text = "Location:"
        mFloorLabel.text = "Floor:"
        mIpLabel.text = "IP:"
        
        mMakeLabel.font = UIFont.systemFont(ofSize: 14)
        mModelLabel.font = UIFont.systemFont(ofSize: 14)
        mTModelLabel.font = UIFont.systemFont(ofSize: 14)
        mSerialLabel.font = UIFont.systemFont(ofSize: 14)
        mStatusLabel.font = UIFont.systemFont(ofSize: 14)
        mColorLabel.font = UIFont.systemFont(ofSize: 14)
        mOwnerLabel.font = UIFont.systemFont(ofSize: 14)
        mDeptLabel.font = UIFont.systemFont(ofSize: 14)
        mLocationLabel.font = UIFont.systemFont(ofSize: 14)
        mFloorLabel.font = UIFont.systemFont(ofSize: 14)
        mIpLabel.font = UIFont.systemFont(ofSize: 14)
        
        mMakeTextField.tag = 0
        mModelTextField.tag = 1
        mTModelTextField.tag = 2
        mSerialTextField.tag = 3
        mOwnerTextField.tag = 4
        mDeptTextField.tag = 5
        mLocationTextField.tag = 6
        mFloorTextField.tag = 7
        mIPTextField.tag = 8
        
        mMakeTextField.placeholder = "Enter Make"
        mModelTextField.placeholder = "Enter Model"
        mTModelTextField.placeholder = "Enter Toner Model"
        mSerialTextField.placeholder = "Enter Serial"
        mOwnerTextField.placeholder = "Enter Owner"
        mDeptTextField.placeholder = "Enter Department"
        mLocationTextField.placeholder = "Enter Location"
        mFloorTextField.placeholder = "Enter Floor"
        mIPTextField.placeholder = "Enter IP"
        
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
        
        mMakeTextField.autocapitalizationType = UITextAutocapitalizationType.words
        mModelTextField.autocapitalizationType = UITextAutocapitalizationType.words
        mTModelTextField.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        mSerialTextField.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        mOwnerTextField.autocapitalizationType = UITextAutocapitalizationType.words
        mDeptTextField.autocapitalizationType = UITextAutocapitalizationType.words
        mLocationTextField.autocapitalizationType = UITextAutocapitalizationType.words
        mFloorTextField.autocapitalizationType = UITextAutocapitalizationType.words
        mIPTextField.autocapitalizationType = UITextAutocapitalizationType.words
        
        addDoneButton()
        
        mSaveButton.titleLabel?.text = "Save Changes"
        
        mIconImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-125)
            make.centerY.equalToSuperview().inset(-130)
            make.height.equalTo(104)
            make.width.equalTo(102)
        }
        
        mMakeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-25)
            make.centerY.equalToSuperview().offset(-226)
            make.width.equalTo(39)
            make.height.equalTo(17)
        }
        
        mMakeTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview().offset(-226)
            make.width.equalTo(174)
            make.height.equalTo(30)
        }
        
        mModelLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-30)
            make.centerY.equalToSuperview().offset(-182)
            make.width.equalTo(44)
            make.height.equalTo(17)
        }
        
        mModelTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview().offset(-182)
            make.width.equalTo(174)
            make.height.equalTo(30)
        }
        
        mTModelLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-32)
            make.centerY.equalToSuperview().offset(-140)
            make.width.equalTo(53)
            make.height.equalTo(17)
        }
        
        mTModelTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview().offset(-140)
            make.width.equalTo(174)
            make.height.equalTo(30)
        }
        
        mSerialLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-30)
            make.centerY.equalToSuperview().offset(-98)
            make.width.equalTo(41)
            make.height.equalTo(17)
        }
        
        mSerialTextField.snp.makeConstraints { (make) in
            
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview().offset(-98)
            make.width.equalTo(174)
            make.height.equalTo(30)
        }
        
        mStatusLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-35)
            make.centerY.equalToSuperview().offset(-56)
            make.width.equalTo(46)
            make.height.equalTo(17)
        }
        
        mStatusPicker.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview().offset(-56)
            make.width.equalTo(175)
            make.height.equalTo(43)
        }
        
        mColorLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-35)
            make.centerY.equalToSuperview().offset(-15)
            make.width.equalTo(39)
            make.height.equalTo(17)
        }
        
        mColorPicker.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview().offset(-15)
            make.width.equalTo(175)
            make.height.equalTo(43)
        }
        
        mOwnerLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-33)
            make.centerY.equalToSuperview().offset(30)
            make.width.equalTo(47)
            make.height.equalTo(17)
        }
        
        mOwnerTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview().offset(30)
            make.width.equalTo(174)
            make.height.equalTo(30)
        }
        
        mDeptLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-45)
            make.centerY.equalToSuperview().offset(75)
            make.width.equalTo(82)
            make.height.equalTo(17)
        }
        
        mDeptTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview().offset(75)
            make.width.equalTo(174)
            make.height.equalTo(30)
        }
        
        mLocationLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-40)
            make.centerY.equalToSuperview().offset(120)
            make.width.equalTo(60)
            make.height.equalTo(17)
        }
        
        mLocationTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview().offset(120)
            make.width.equalTo(174)
            make.height.equalTo(30)
        }
        
        mFloorLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-33)
            make.centerY.equalToSuperview().offset(165)
            make.width.equalTo(37)
            make.height.equalTo(17)
        }
        
        mFloorTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview().offset(165)
            make.width.equalTo(174)
            make.height.equalTo(30)
        }
        
        mIpLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-25)
            make.centerY.equalToSuperview().offset(210)
            make.width.equalTo(17)
            make.height.equalTo(17)
        }
        
        mIPTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(40)
            make.centerY.equalToSuperview().offset(210)
            make.width.equalTo(84)
            make.height.equalTo(30)
        }
        
        mSaveButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(250)
            make.width.equalTo(98)
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
    
    /**
     Attaches a "Done" UIBarButtonItem to TextFields that are strictly numeric
     */
    func addDoneButton(){
        let toolbarDone = UIToolbar.init()
        toolbarDone.sizeToFit()
        let barBtnDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(PrinterAddVC.resignmIPTextField))
        
        toolbarDone.items = [barBtnDone]
        mIPTextField.inputAccessoryView = toolbarDone
    }
    
    /**
     Resigns the First Responsder of the Textfield
     */
    @objc func resignmIPTextField(){
        mIPTextField.resignFirstResponder()
    }
    
    /**
     Updates the printer's information based on TextFields & UIPickerView value
    */
    @IBAction func updatePrinter(){
        
        let make: String = mMakeTextField.text!
        let model: String = mModelTextField.text!
        let tModel: String = mTModelTextField.text!
        let serial: String = mSerialTextField.text!
        let status: String = mStatus ?? mStatusPickerOptions[mStatusIndex!]
        let color: String = mColor ?? mColorPickerOptions[mColorIndex!]
        let owner: String = mOwnerTextField.text!
        let dept: String = mDeptTextField.text!
        let location: String = mLocationTextField.text!
        let floor: String = mFloorTextField.text!
        let ip: String = mIPTextField.text!
        
        mDatabase?.updatePrinter(id: (mSelectedPrinter?.id)!, make: make, model: model, tmodel: tModel, serial: serial, status: status, color: color, owner: owner, department: dept, location: location, floor: floor, ip: ip)
        
        self.navigationController?.popToRootViewController(animated: true)
    }

}
