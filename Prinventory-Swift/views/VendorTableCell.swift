
import UIKit

class VendorTableCell: UITableViewCell {
    
    @IBOutlet weak var mIconImage: UIImageView!
    
    @IBOutlet weak var mNameLabel: UILabel!
    @IBOutlet weak var mPhoneLabel: UILabel!
    @IBOutlet weak var mEmailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mNameLabel.font = UIFont.boldSystemFont(ofSize: mNameLabel.font.pointSize)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
