
import UIKit
import SnapKit

class PrinterTableCell: UITableViewCell {

    @IBOutlet weak var mIconImage: UIImageView!
    
    @IBOutlet weak var mMakeLabel: UILabel!
    @IBOutlet weak var mLocationLabel: UILabel!
    @IBOutlet weak var mIPLabel: UILabel!
    
    @IBOutlet weak var mStatusImage: UIImageView!
    @IBOutlet weak var mColorImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mIconImage.image = UIImage(named: "ic_printer.png")
        
        mLocationLabel.textColor = UIColor.lightGray
        mIPLabel.textColor = UIColor.lightGray
        
        mMakeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        mLocationLabel.font = UIFont.systemFont(ofSize: 14)
        mIPLabel.font = UIFont.systemFont(ofSize: 14)
        
        
        mIconImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(5)
            make.width.equalTo(45)
            make.height.equalTo(48)
        }

        mMakeLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-15)
            make.left.equalToSuperview().offset(58)
            make.width.equalTo(109)
            make.height.equalTo(31)
        }
        
        mLocationLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(1)
            make.left.equalToSuperview().offset(59)
            make.width.equalTo(162)
            make.height.equalTo(21)
        }
        
        mIPLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(59)
            make.width.equalTo(56)
            make.height.equalTo(21)
        }
        
        
        mStatusImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-70)
            make.width.equalTo(43)
            make.height.equalTo(43)
        }
        
        mColorImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-25)
            make.width.equalTo(42)
            make.height.equalTo(42)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
