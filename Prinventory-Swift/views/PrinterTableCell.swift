
import UIKit

class PrinterTableCell: UITableViewCell {

    @IBOutlet weak var mIconImage: UIImageView!
    
    @IBOutlet weak var mMakeLabel: UILabel!
    @IBOutlet weak var mLocationLabel: UILabel!
    @IBOutlet weak var mIPLabel: UILabel!
    
    @IBOutlet weak var mStatusImage: UIImageView!
    @IBOutlet weak var mColorImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mMakeLabel.textColor = UIColor.lightGray
        mLocationLabel.textColor = UIColor.lightGray
        mIPLabel.textColor = UIColor.lightGray
        
        mMakeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        mLocationLabel.font = UIFont.systemFont(ofSize: 14)
        mIPLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
