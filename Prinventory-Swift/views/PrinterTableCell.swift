
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
        
        mMakeLabel.font = UIFont.boldSystemFont(ofSize: mMakeLabel.font.pointSize)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
