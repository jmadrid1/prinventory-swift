
import UIKit

class VendorTableCell: UITableViewCell {
    
    @IBOutlet weak var mIconImage: UIImageView!
    
    @IBOutlet weak var mNameLabel: UILabel!
    @IBOutlet weak var mPhoneLabel: UILabel!
    @IBOutlet weak var mEmailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        mPhoneLabel.textColor = UIColor.lightGray
        mEmailLabel.textColor = UIColor.lightGray
        
        mNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        mPhoneLabel.font = UIFont.systemFont(ofSize: 14)
        mEmailLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
