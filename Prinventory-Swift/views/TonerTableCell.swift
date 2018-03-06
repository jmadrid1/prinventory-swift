
import UIKit

class TonerTableCell: UITableViewCell {
    
    @IBOutlet weak var mIconImage: UIImageView!
    @IBOutlet weak var mMakeModelLabel: UILabel!
    @IBOutlet weak var mTModelLabel: UILabel!
    
    @IBOutlet weak var mColorImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
         mMakeModelLabel.font = UIFont.boldSystemFont(ofSize: mMakeModelLabel.font.pointSize)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
