
import UIKit

class VendorDetailVC: UIViewController {

    @IBOutlet weak var mIconImage: UIImageView!
    
    @IBOutlet weak var mNameLabel: UILabel!
    @IBOutlet weak var mPhoneLabel: UILabel!
    @IBOutlet weak var mEmailLabel: UILabel!
    @IBOutlet weak var mStreetLabel: UILabel!
    @IBOutlet weak var mCityLabel: UILabel!
    @IBOutlet weak var mStateLabel: UILabel!
    @IBOutlet weak var mZipcodeLabel: UILabel!
    
    var mSelectedVendor: Vendor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mNameLabel.text = mSelectedVendor?.name
        
        mPhoneLabel.text = "Phone:  " + (mSelectedVendor?.phone)!
        mEmailLabel.text = "Email:  " + (mSelectedVendor?.email)!
        mStreetLabel.text = "Street:  " + (mSelectedVendor?.street)!
        mCityLabel.text = "City:  " + (mSelectedVendor?.city)!
        mStateLabel.text = "State:  " + (mSelectedVendor?.state)!
        mZipcodeLabel.text = "Zipcode:  " + (mSelectedVendor?.zipcode)!
 
        mPhoneLabel.textColor = UIColor.lightGray
        mEmailLabel.textColor = UIColor.lightGray
        mStreetLabel.textColor = UIColor.lightGray
        mCityLabel.textColor = UIColor.lightGray
        mStateLabel.textColor = UIColor.lightGray
        mZipcodeLabel.textColor = UIColor.lightGray
        
        mNameLabel.font = UIFont.boldSystemFont(ofSize: 19)
        mPhoneLabel.font = UIFont.systemFont(ofSize: 17)
        mEmailLabel.font = UIFont.systemFont(ofSize: 17)
        mStreetLabel.font = UIFont.systemFont(ofSize: 17)
        mCityLabel.font = UIFont.systemFont(ofSize: 17)
        mZipcodeLabel.font = UIFont.systemFont(ofSize: 17)
        
        mNameLabel.sizeToFit()
        mPhoneLabel.sizeToFit()
        mEmailLabel.sizeToFit()
        mStreetLabel.sizeToFit()
        mCityLabel.sizeToFit()
        mStateLabel.sizeToFit()
        mZipcodeLabel.sizeToFit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     Passes Vendor object to VendorUpdateVC
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? VendorUpdateVC{
            vc.mSelectedVendor = mSelectedVendor
        }
    }

}
