
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
        
        mMakeModelLabel.text = (mSelectedToner?.make)! + " " + (mSelectedToner?.model)!
        mTModelLabel.text = "Toner Model:    " + (mSelectedToner?.tmodel)!
        mColorLabel.text = "Color:   " + (mSelectedToner?.color)!
        mBlackLabel.text = "Black:   " + blackQuantity
        mCyanLabel.text = "Cyan:   " + cyanQuantity
        mYellowLabel.text = "Yellow:    " +  yellowQuantity
        mMagentaLabel.text = "Magenta: " + magentaQuantity
        
        mMakeModelLabel.font = UIFont.boldSystemFont(ofSize: mMakeModelLabel.font.pointSize)
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TonerUpdateVC{
            vc.mSelectedToner = self.mSelectedToner
        }
    }

}
