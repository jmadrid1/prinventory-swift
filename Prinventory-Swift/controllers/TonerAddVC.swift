
import UIKit

class TonerAddVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var mMakeTextField: UITextField!
    @IBOutlet weak var mModelTextField: UITextField!
    @IBOutlet weak var mTModelTextField: UITextField!
    
    @IBOutlet weak var mColorPicker: UIPickerView!
    
    @IBOutlet weak var mBlackLabel: UILabel!
    @IBOutlet weak var mBlackQuantityLabel: UILabel!
    
    @IBOutlet weak var mCyanLabel: UILabel!
    @IBOutlet weak var mCyanQuantityLabel: UILabel!
    
    @IBOutlet weak var mYellowLabel: UILabel!
    @IBOutlet weak var mYellowQuantityLabel: UILabel!
    
    @IBOutlet weak var mMagentaLabel: UILabel!
    @IBOutlet weak var mMagentaQuantityLabel: UILabel!
    
    @IBOutlet weak var mBlackStepper: UIStepper!
    @IBOutlet weak var mCyanStepper: UIStepper!
    @IBOutlet weak var mYellowStepper: UIStepper!
    @IBOutlet weak var mMagentaStepper: UIStepper!
    
    @IBOutlet weak var mSaveButton: UIButton!
    
    @IBAction func blackSteps(_ sender: UIStepper) {
        mBlackQuantityLabel.text = String(sender.value)
        mBlackQuantityLabel.sizeToFit()
    }
    
    @IBAction func cyanSteps(_ sender: UIStepper) {
        mCyanQuantityLabel.text = String(sender.value)
        mCyanQuantityLabel.sizeToFit()
    }
    
    @IBAction func yellowSteps(_ sender: UIStepper) {
        mYellowQuantityLabel.text = String(sender.value)
        mYellowQuantityLabel.sizeToFit()
    }
    
    @IBAction func magentaSteps(_ sender: UIStepper) {
        mMagentaQuantityLabel.text = String(sender.value)
        mMagentaQuantityLabel.sizeToFit()
    }
    
    var mColorPickerOptions = ["BW", "Color"]
    
    var color: String?
    
    var testDb: Database?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testDb = Database()
        
        mCyanStepper.isHidden = true
        mCyanLabel.isHidden = true
        mCyanQuantityLabel.isHidden = true
        
        mYellowStepper.isHidden = true
        mYellowLabel.isHidden = true
        mYellowQuantityLabel.isHidden = true
        
        mMagentaStepper.isHidden = true
        mMagentaLabel.isHidden = true
        mMagentaQuantityLabel.isHidden = true
        
        mMakeTextField.returnKeyType = .done
        mModelTextField.returnKeyType = .done
        mTModelTextField.returnKeyType = .done
        
        mBlackQuantityLabel.sizeToFit()
        mCyanQuantityLabel.sizeToFit()
        mYellowQuantityLabel.sizeToFit()
        mMagentaQuantityLabel.sizeToFit()
        
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        color = mColorPickerOptions[row]
        
        if(color == "Color"){
            mCyanStepper.isHidden = false
            mCyanLabel.isHidden = false
            mCyanQuantityLabel.isHidden = false
            
            mYellowStepper.isHidden = false
            mYellowLabel.isHidden = false
            mYellowQuantityLabel.isHidden = false
            
            mMagentaStepper.isHidden = false
            mMagentaLabel.isHidden = false
            mMagentaQuantityLabel.isHidden = false
        }else{
            mCyanStepper.isHidden = true
            mCyanLabel.isHidden = true
            mCyanQuantityLabel.isHidden = true
            
            mYellowStepper.isHidden = true
            mYellowLabel.isHidden = true
            mYellowQuantityLabel.isHidden = true
            
            mMagentaStepper.isHidden = true
            mMagentaLabel.isHidden = true
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
    
    @IBAction func addToner(){
        
        let make: String = mMakeTextField.text!
        let model: String = mModelTextField.text!
        let tModel: String = mTModelTextField.text!
        let color: String = self.color ?? mColorPickerOptions[0]
        let black: Double = mBlackStepper.value
        let cyan: Double = mCyanStepper.value
        let yellow: Double = mYellowStepper.value
        let magenta: Double = mMagentaStepper.value
        
        testDb?.addToner(make: make, model: model, tmodel: tModel, color: color, black: black, cyan: cyan, yellow: yellow, magenta: magenta)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
