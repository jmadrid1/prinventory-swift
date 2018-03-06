
import UIKit

class PrinterDetailVC: UIViewController {

    @IBOutlet weak var mIconImage: UIImageView!
    @IBOutlet weak var mStatusImage: UIImageView!
    @IBOutlet weak var mColorImage: UIImageView!
    
    @IBOutlet weak var mMakeModelLabel: UILabel!
    @IBOutlet weak var mTModelLabel: UILabel!
    @IBOutlet weak var mSerialLabel: UILabel!
    @IBOutlet weak var mStatusLabel: UILabel!
    @IBOutlet weak var mColorLabel: UILabel!
    @IBOutlet weak var mOwnerLabel: UILabel!
    @IBOutlet weak var mDeptLabel: UILabel!
    @IBOutlet weak var mLocationLabel: UILabel!
    @IBOutlet weak var mFloorLabel: UILabel!
    @IBOutlet weak var mIPLabel: UILabel!
    
    var mSelectedPrinter: Printer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mMakeModelLabel.font = UIFont.boldSystemFont(ofSize: mMakeModelLabel.font.pointSize)
        mMakeModelLabel.text = (mSelectedPrinter?.make)! + " " + (mSelectedPrinter?.model)!
        mTModelLabel.text = "Toner Model:    " + (mSelectedPrinter?.tmodel)!
        mSerialLabel.text = "Serial:    " + (mSelectedPrinter?.serial)!
        mStatusLabel.text = "Status:     " + (mSelectedPrinter?.status)!
        mColorLabel.text = "Color:   " + (mSelectedPrinter?.color)!
        mOwnerLabel.text = "Owner:   " + (mSelectedPrinter?.owner)!
        mDeptLabel.text = "Department:   " + (mSelectedPrinter?.department)!
        mLocationLabel.text = "Location:     " + (mSelectedPrinter?.location)!
        mFloorLabel.text = "Floor:   " + (mSelectedPrinter?.floor)!
        mIPLabel.text = "IP:     " + (mSelectedPrinter?.ip)!
        
        mMakeModelLabel.sizeToFit()
        mTModelLabel.sizeToFit()
        mSerialLabel.sizeToFit()
        mStatusLabel.sizeToFit()
        mColorLabel.sizeToFit()
        mOwnerLabel.sizeToFit()
        mDeptLabel.sizeToFit()
        mFloorLabel.sizeToFit()
        mLocationLabel.sizeToFit()
        mIPLabel.sizeToFit()
        
        if(mSelectedPrinter?.status == "Active"){
            mStatusImage.image = UIImage(named: "ic_status_active.png")
        }else{
            mStatusImage.image = UIImage(named: "ic_status_inactive.png")
        }
        
        if(mSelectedPrinter?.color == "Color"){
            mColorImage.image = UIImage(named: "ic_color_cell.png")
        }else{
            mColorImage.image = UIImage(named: "ic_bw_cell.png")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PrinterUpdateVC{
            vc.mSelectedPrinter = self.mSelectedPrinter
        }
    }

}
