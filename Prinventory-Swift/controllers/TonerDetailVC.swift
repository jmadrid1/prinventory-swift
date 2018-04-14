
import UIKit

class TonerDetailVC: UIViewController {
    
    @IBOutlet weak var mIconImage: UIImageView!
    
    @IBOutlet weak var mMakeModelLabel: UILabel!
    @IBOutlet weak var mTModelLabel: UILabel!
    @IBOutlet weak var mColorLabel: UILabel!
    @IBOutlet weak var mBlackLabel: UILabel!
    @IBOutlet weak var mCyanLabel: UILabel!
    @IBOutlet weak var mYellowLabel: UILabel!
    @IBOutlet weak var mMagentaLabel: UILabel!
    
    var mSelectedToner: Toner?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blackQuantity: String = (mSelectedToner?.black.description)!
        let cyanQuantity: String = (mSelectedToner?.black.description)!
        let yellowQuantity: String = (mSelectedToner?.black.description)!
        let magentaQuantity: String = (mSelectedToner?.black.description)!
        
        mIconImage.image = UIImage(named: "ic_toner.png")
        
        mMakeModelLabel.text = (mSelectedToner?.make)! + " " + (mSelectedToner?.model)!
        
        mTModelLabel.text = "Toner Model:    " + (mSelectedToner?.tmodel)!
        mColorLabel.text = "Color:   " + (mSelectedToner?.color)!
        mBlackLabel.text = "Black:   " + blackQuantity
        mCyanLabel.text = "Cyan:   " + cyanQuantity
        mYellowLabel.text = "Yellow:    " +  yellowQuantity
        mMagentaLabel.text = "Magenta: " + magentaQuantity
        
        mTModelLabel.textColor = UIColor.lightGray
        mColorLabel.textColor = UIColor.lightGray
        mBlackLabel.textColor = UIColor.lightGray
        mCyanLabel.textColor = UIColor.lightGray
        mYellowLabel.textColor = UIColor.lightGray
        mMagentaLabel.textColor = UIColor.lightGray
        
        mMakeModelLabel.font = UIFont.boldSystemFont(ofSize: 19)
        mTModelLabel.font = UIFont.systemFont(ofSize: 17)
        mColorLabel.font = UIFont.systemFont(ofSize: 17)
        mBlackLabel.font = UIFont.systemFont(ofSize: 17)
        mCyanLabel.font = UIFont.systemFont(ofSize: 17)
        mYellowLabel.font = UIFont.systemFont(ofSize: 17)
        mMagentaLabel.font = UIFont.systemFont(ofSize: 17)
        
        mMakeModelLabel.sizeToFit()
        mTModelLabel.sizeToFit()
        mColorLabel.sizeToFit()
        
        mBlackLabel.sizeToFit()
        mCyanLabel.sizeToFit()
        mYellowLabel.sizeToFit()
        mMagentaLabel.sizeToFit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /**
     Passes Toner object to TonerUpdateVC
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TonerUpdateVC{
            vc.mSelectedToner = mSelectedToner
        }
    }

}
