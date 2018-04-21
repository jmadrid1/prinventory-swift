
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
        
        mIconImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(5)
            make.width.equalTo(55)
            make.height.equalTo(51)
        }
        
        mNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-13)
            make.left.equalToSuperview().offset(65)
            make.width.equalTo(109)
            make.height.equalTo(31)
        }
        
        mPhoneLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(2)
            make.left.equalToSuperview().offset(65)
            make.width.equalTo(157)
            make.height.equalTo(21)
        }
        
        mEmailLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(65)
            make.width.equalTo(174)
            make.height.equalTo(21)
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
