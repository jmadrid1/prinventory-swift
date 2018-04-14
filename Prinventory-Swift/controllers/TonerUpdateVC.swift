
import UIKit

class TonerUpdateVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

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
    
    var mSelectedToner: Toner?
    var mColorPickerOptions = ["BW", "Color"]
    var mColor: String?
    var mColorIndex: Int?
    
    var updatedBlack: Double?
    var updatedCyan: Double?
    var updatedYellow: Double?
    var updatedMagenta: Double?
    
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
        
        mMakeTextField.text = mSelectedToner?.make
        mModelTextField.text = mSelectedToner?.model
        mTModelTextField.text = mSelectedToner?.tmodel
        
        let currentColor = mSelectedToner?.color
        mColorIndex = mColorPickerOptions.index(of: currentColor!)
        mColorPicker.selectRow(mColorIndex!, inComponent: 0, animated: true)
        
        mBlackStepper.value = (mSelectedToner?.black)!
        mBlackQuantityLabel.text = "Black:       " + String(mBlackStepper.value)
        
        mCyanStepper.value = (mSelectedToner?.cyan)!
        mCyanQuantityLabel.text = "Cyan:        " + String(mCyanStepper.value)
        
        mYellowStepper.value = (mSelectedToner?.yellow)!
        mYellowQuantityLabel.text = "Yellow:      " + String(mYellowStepper.value)
        
        mMagentaStepper.value = (mSelectedToner?.magenta)!
        mMagentaQuantityLabel.text = "Magenta:  " + String(mMagentaStepper.value)
        
        mBlackQuantityLabel.font = UIFont.systemFont(ofSize: 14)
        mCyanQuantityLabel.font = UIFont.systemFont(ofSize: 14)
        mYellowQuantityLabel.font = UIFont.systemFont(ofSize: 14)
        mMagentaQuantityLabel.font = UIFont.systemFont(ofSize: 14)
        
        mBlackQuantityLabel.sizeToFit()
        mCyanQuantityLabel.sizeToFit()
        mYellowQuantityLabel.sizeToFit()
        mMagentaQuantityLabel.sizeToFit()
        
        if(mSelectedToner?.color == "BW"){
            mCyanStepper.isHidden = true
            mCyanQuantityLabel.isHidden = true
            
            mYellowStepper.isHidden = true
            mYellowQuantityLabel.isHidden = true
            
            mMagentaStepper.isHidden = true
            mMagentaQuantityLabel.isHidden = true
        }else{
            mCyanStepper.isHidden = false
            mCyanQuantityLabel.isHidden = false
            
            mYellowStepper.isHidden = false
            mYellowQuantityLabel.isHidden = false
            
            mMagentaStepper.isHidden = false
            mMagentaQuantityLabel.isHidden = false
        }
        
        mSaveButton.titleLabel?.text = "Save Changes"
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
        mBlackQuantityLabel.text = "Black:       " + String(sender.value)
        mBlackQuantityLabel.sizeToFit()
        updatedBlack = sender.value
    }
    
    @IBAction func cyanSteps(_ sender: UIStepper) {
        mCyanQuantityLabel.text = "Cyan:        " + String(sender.value)
        mCyanQuantityLabel.sizeToFit()
        updatedCyan = sender.value
    }
    
    @IBAction func yellowSteps(_ sender: UIStepper) {
        mYellowQuantityLabel.text = "Yellow:      " + String(sender.value)
        mYellowQuantityLabel.sizeToFit()
        updatedYellow = sender.value
    }
    
    @IBAction func magentaSteps(_ sender: UIStepper) {
        mMagentaQuantityLabel.text = "Magenta:  " + String(sender.value)
        mMagentaQuantityLabel.sizeToFit()
        updatedMagenta = sender.value
    }
    
    
    /**
     Updates the toner's information based on TextFields, UIStepper & UIPickerView values
     */
    @IBAction func updateToner(){
        
        let make: String = mMakeTextField.text!
        let model: String = mModelTextField.text!
        let tModel: String = mTModelTextField.text!
        let color: String = mColor ?? mColorPickerOptions[mColorIndex!]
        let black: Double = mBlackStepper.value
        let cyan: Double = mCyanStepper.value
        let yellow: Double = mYellowStepper.value
        let magenta: Double = mMagentaStepper.value
        
        print(String(magenta))
        
        mDatabase?.updateToner(id: (mSelectedToner?.id)!, make: make, model: model, tmodel: tModel, color: color, black: black, cyan: cyan, yellow: yellow, magenta: magenta)
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
