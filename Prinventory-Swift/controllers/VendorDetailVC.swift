
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
        
        mNameLabel.font = UIFont.boldSystemFont(ofSize: mNameLabel.font.pointSize)
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? VendorUpdateVC{
            vc.mSelectedVendor = self.mSelectedVendor
        }
    }

}
