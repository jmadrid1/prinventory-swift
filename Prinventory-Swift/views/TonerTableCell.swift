
import UIKit

class TonerTableCell: UITableViewCell {
    
    @IBOutlet weak var mIconImage: UIImageView!
    @IBOutlet weak var mMakeModelLabel: UILabel!
    @IBOutlet weak var mTModelLabel: UILabel!
    
    @IBOutlet weak var mColorImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        mTModelLabel.textColor = UIColor.lightGray
        
        mMakeModelLabel.font = UIFont.boldSystemFont(ofSize: 17)
        mTModelLabel.font = UIFont.systemFont(ofSize: 17)
        
        mIconImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(5)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        mMakeModelLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(59)
            make.width.equalTo(109)
            make.height.equalTo(31)
        }
        
        mTModelLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(59)
            make.width.equalTo(96)
            make.height.equalTo(21)
        }
        
        mColorImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-50)
            make.width.equalTo(47)
            make.height.equalTo(47)
        }

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
