
import UIKit

class TonerAddVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var mIconImage: UIImageView!
    
    @IBOutlet weak var mMakeLabel: UILabel!
    @IBOutlet weak var mModelLabel: UILabel!
    @IBOutlet weak var mTModelLabel: UILabel!
    
    @IBOutlet weak var mMakeTextField: UITextField!
    @IBOutlet weak var mModelTextField: UITextField!
    @IBOutlet weak var mTModelTextField: UITextField!
    
    @IBOutlet weak var mColorPicker: UIPickerView!
    
    @IBOutlet weak var mBlackQuantityLabel: UILabel!
    @IBOutlet weak var mCyanQuantityLabel: UILabel!
    @IBOutlet weak var mYellowQuantityLabel: UILabel!
    @IBOutlet weak var mMagentaQuantityLabel: UILabel!
    
    @IBOutlet weak var mBlackStepper: UIStepper!
    @IBOutlet weak var mCyanStepper: UIStepper!
    @IBOutlet weak var mYellowStepper: UIStepper!
    @IBOutlet weak var mMagentaStepper: UIStepper!
    
    @IBOutlet weak var mSaveButton: UIButton!
    
    var mColorPickerOptions = ["BW", "Color"]
    
    var mColor: String?
    
    var mDatabase: Database?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mDatabase = Database()
        
        mIconImage.image = UIImage(named: "ic_toner.png")
        
        mMakeLabel.text = "Make:"
        mModelLabel.text = "Model:"
        mTModelLabel.text = "TModel:"
        
        mMakeLabel.font = UIFont.systemFont(ofSize: 14)
        mModelLabel.font = UIFont.systemFont(ofSize: 14)
        mTModelLabel.font = UIFont.systemFont(ofSize: 14)
       
        mMakeTextField.tag = 0
        mModelTextField.tag = 1
        mTModelTextField.tag = 2
        
        mMakeTextField.placeholder = "Enter Make"
        mModelTextField.placeholder = "Enter Model"
        mTModelTextField.placeholder = "Enter Toner Model"
        
        mCyanStepper.isHidden = true
        mCyanQuantityLabel.isHidden = true
        
        mYellowStepper.isHidden = true
        mYellowQuantityLabel.isHidden = true
        
        mMagentaStepper.isHidden = true
        mMagentaQuantityLabel.isHidden = true
        
        mMakeTextField.returnKeyType = .done
        mModelTextField.returnKeyType = .done
        mTModelTextField.returnKeyType = .done
        
        mMakeTextField.autocapitalizationType = UITextAutocapitalizationType.words
        mModelTextField.autocapitalizationType = UITextAutocapitalizationType.words
        mTModelTextField.autocapitalizationType = UITextAutocapitalizationType.allCharacters
                
        mBlackQuantityLabel.text = "Black:       " + String(format: "%.f", mBlackStepper.value)
        mCyanQuantityLabel.text = "Cyan:        " + String(format: "%.f", mCyanStepper.value)
        mYellowQuantityLabel.text = "Yellow:      " + String(format: "%.f", mYellowStepper.value)
        mMagentaQuantityLabel.text = "Magenta:   " + String(format: "%.f", mMagentaStepper.value)
        
        mBlackQuantityLabel.font = UIFont.systemFont(ofSize: 14)
        mCyanQuantityLabel.font = UIFont.systemFont(ofSize: 14)
        mYellowQuantityLabel.font = UIFont.systemFont(ofSize: 14)
        mMagentaQuantityLabel.font = UIFont.systemFont(ofSize: 14)
        
        mBlackQuantityLabel.sizeToFit()
        mCyanQuantityLabel.sizeToFit()
        mYellowQuantityLabel.sizeToFit()
        mMagentaQuantityLabel.sizeToFit()
        
        mSaveButton.titleLabel?.text = "Save"
        
        mIconImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-125)
            make.centerY.equalToSuperview().inset(-130)
            make.height.equalTo(104)
            make.width.equalTo(102)
        }
        
        mMakeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(30)
            make.centerY.equalToSuperview().offset(-182)
            make.width.equalTo(174)
            make.height.equalTo(30)
        }
        
        mModelLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-32)
            make.centerY.equalToSuperview().offset(-140)
            make.width.equalTo(53)
            make.height.equalTo(17)
        }
        
        mTModelLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-38)
            make.centerY.equalToSuperview().offset(-98)
            make.width.equalTo(53)
            make.height.equalTo(17)
        }
        
        mMakeTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview().offset(-182)
            make.width.equalTo(174)
            make.height.equalTo(30)
        }
        
        mModelTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview().offset(-140)
            make.width.equalTo(174)
            make.height.equalTo(30)
        }
        
        mTModelTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(85)
            make.centerY.equalToSuperview().offset(-98)
            make.width.equalTo(174)
            make.height.equalTo(30)
        }
        
        mColorPicker.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview().offset(-46)
            make.width.equalTo(175)
            make.height.equalTo(43)
        }
        
        mBlackQuantityLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-63)
            make.centerY.equalToSuperview().offset(11)
            make.width.equalTo(94)
            make.height.equalTo(29)
        }
        
        mCyanQuantityLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-63)
            make.centerY.equalToSuperview().offset(67)
            make.width.equalTo(94)
            make.height.equalTo(29)
        }
        
        mYellowQuantityLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-66)
            make.centerY.equalToSuperview().offset(133)
            make.width.equalTo(90)
            make.height.equalTo(21)
        }
        
        mMagentaQuantityLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-66)
            make.centerY.equalToSuperview().offset(199)
            make.width.equalTo(94)
            make.height.equalTo(29)
        }
        
        mBlackStepper.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(50)
            make.centerY.equalToSuperview().offset(10)
            make.width.equalTo(47)
            make.height.equalTo(21)
        }
        
        mCyanStepper.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(49)
            make.centerY.equalToSuperview().offset(65)
            make.width.equalTo(44)
            make.height.equalTo(21)
        }
        
        mYellowStepper.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(54)
            make.centerY.equalToSuperview().offset(130)
            make.width.equalTo(54)
            make.height.equalTo(21)
        }
        
        mMagentaStepper.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(74)
            make.centerY.equalToSuperview().offset(198)
            make.width.equalTo(94)
            make.height.equalTo(29)
        }
        
        mSaveButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(260)
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
        return mColorPickerOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(mColorPickerOptions[row])"
    }
    
    
    /**
     Hides/Shows the corresponding UILabels and UISteppers based on the UIPickerView selection
    */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        mColor = mColorPickerOptions[row]
        
        if(mColor == "Color"){
            mCyanStepper.isHidden = false
            mCyanQuantityLabel.isHidden = false
            
            mYellowStepper.isHidden = false
            mYellowQuantityLabel.isHidden = false
            
            mMagentaStepper.isHidden = false
            mMagentaQuantityLabel.isHidden = false
        }else{
            mCyanStepper.isHidden = true
            mCyanQuantityLabel.isHidden = true
            
            mYellowStepper.isHidden = true
            mYellowQuantityLabel.isHidden = true
            
            mMagentaStepper.isHidden = true
            mMagentaQuantityLabel.isHidden = true
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
            
        default:
            return true
        }
    }
    
    /**
     Limits the amount of characters for the specified TextFields
     */
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else { return true }
        
        let newLength = text.count + string.count - range.length
        
        switch textField.tag {
            
        case 0:
            return newLength <= 15
            
        case 1:
            return newLength <= 15
            
        case 2:
            return newLength <= 15
            
        default:
            return newLength <= 15
        }
    }
    
    @IBAction func blackSteps(_ sender: UIStepper) {
        mBlackQuantityLabel.text = "Black:        " + String(format: "%.f", sender.value)
        mBlackQuantityLabel.sizeToFit()
    }
    
    @IBAction func cyanSteps(_ sender: UIStepper) {
        mCyanQuantityLabel.text = "Cyan:        " + String(format: "%.f", sender.value)
        mCyanQuantityLabel.sizeToFit()
    }
    
    @IBAction func yellowSteps(_ sender: UIStepper) {
        mYellowQuantityLabel.text = "Yellow:      " + String(format: "%.f", sender.value)
        mYellowQuantityLabel.sizeToFit()
    }
    
    @IBAction func magentaSteps(_ sender: UIStepper) {
        mMagentaQuantityLabel.text = "Magenta:   " + String(format: "%.f", sender.value)
        mMagentaQuantityLabel.sizeToFit()
    }
    
    /**
     Saves toner to the SQLite Database based off of input from TextFields, UIPickerView & UIStepper values.
     */
    @IBAction func addToner(){
        
        let make: String = mMakeTextField.text!
        let model: String = mModelTextField.text!
        let tModel: String = mTModelTextField.text!
        let color: String = mColor ?? mColorPickerOptions[0]
        let black: Double = mBlackStepper.value
        let cyan: Double = mCyanStepper.value
        let yellow: Double = mYellowStepper.value
        let magenta: Double = mMagentaStepper.value
        
        mDatabase?.addToner(make: make, model: model, tmodel: tModel, color: color, black: black, cyan: cyan, yellow: yellow, magenta: magenta)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
