
import UIKit
import SnapKit

class PrinterDetailVC: UIViewController {

    @IBOutlet weak var mStatusImage: UIImageView!
    @IBOutlet weak var mIconImage: UIImageView!
    @IBOutlet weak var mColorImage: UIImageView!
    
    @IBOutlet weak var mMakeModelLabel: UILabel!
    @IBOutlet weak var mTModelLabel: UILabel!
    @IBOutlet weak var mSerialLabel: UILabel!
    @IBOutlet weak var mStatusLabel: UILabel!
    @IBOutlet weak var mColorLabel: UILabel!
    @IBOutlet weak var mOwnerLabel: UILabel!
    @IBOutlet weak var mDeptLabel: UILabel!
    @IBOutlet weak var mLocationLabel: UILabel!
    @IBOutlet weak var mFloorLabel: UILabel!
    @IBOutlet weak var mIPLabel: UILabel!
    
    var mSelectedPrinter: Printer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mStatusImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-120)
            make.centerY.equalToSuperview().inset(-100)
            make.height.equalTo(73)
            make.width.equalTo(79)
        }
        
        mIconImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().inset(-160)
            make.height.equalTo(141)
            make.width.equalTo(138)
        }
        
        mColorImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().inset(120)
            make.centerY.equalToSuperview().inset(-100)
            make.height.equalTo(73)
            make.width.equalTo(79)
        }
        
        mMakeModelLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-60)
            make.height.equalTo(141)
            make.width.equalTo(138)
        }
        
        mTModelLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(65)
            make.width.equalTo(293)
            make.height.equalTo(51)
        }
        
        mSerialLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(65)
            make.width.equalTo(293)
            make.height.equalTo(31)
        }
        
        mStatusLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(65)
            make.width.equalTo(168)
            make.height.equalTo(21)
        }
        
        mColorLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(90)
            make.left.equalToSuperview().offset(65)
            make.width.equalTo(168)
            make.height.equalTo(21)
        }
        
        mOwnerLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(120)
            make.left.equalToSuperview().offset(65)
            make.width.equalTo(240)
            make.height.equalTo(51)
        }
        
        mDeptLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(150)
            make.left.equalToSuperview().offset(65)
            make.width.equalTo(291)
            make.height.equalTo(31)
        }
        
        mLocationLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(180)
            make.left.equalToSuperview().offset(65)
            make.width.equalTo(291)
            make.height.equalTo(21)
        }
        
        mFloorLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(210)
            make.left.equalToSuperview().offset(65)
            make.width.equalTo(187)
            make.height.equalTo(21)
        }
        
        mIPLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(240)
            make.left.equalToSuperview().offset(65)
            make.width.equalTo(88)
            make.height.equalTo(21)
        }
        
        mStatusImage.image = UIImage(named: "ic_status_active.png")
        mIconImage.image = UIImage(named: "ic_printer.png")
        mColorImage.image = UIImage(named: "ic_status_active.png")
        
        mMakeModelLabel.text = (mSelectedPrinter?.make)! + " " + (mSelectedPrinter?.model)!
        
        mTModelLabel.text = "Toner Model:    " + (mSelectedPrinter?.tmodel)!
        mSerialLabel.text = "Serial:    " + (mSelectedPrinter?.serial)!
        mStatusLabel.text = "Status:     " + (mSelectedPrinter?.status)!
        mColorLabel.text = "Color:   " + (mSelectedPrinter?.color)!
        mOwnerLabel.text = "Owner:   " + (mSelectedPrinter?.owner)!
        mDeptLabel.text = "Department:   " + (mSelectedPrinter?.department)!
        mLocationLabel.text = "Location:     " + (mSelectedPrinter?.location)!
        mFloorLabel.text = "Floor:   " + (mSelectedPrinter?.floor)!
        mIPLabel.text = "IP:     " + (mSelectedPrinter?.ip)!
        
        mTModelLabel.textColor = UIColor.lightGray
        mSerialLabel.textColor = UIColor.lightGray
        mStatusLabel.textColor = UIColor.lightGray
        mColorLabel.textColor = UIColor.lightGray
        mOwnerLabel.textColor = UIColor.lightGray
        mDeptLabel.textColor = UIColor.lightGray
        mLocationLabel.textColor = UIColor.lightGray
        mFloorLabel.textColor = UIColor.lightGray
        mIPLabel.textColor = UIColor.lightGray
        
        mMakeModelLabel.font = UIFont.boldSystemFont(ofSize: 19)
        mTModelLabel.font = UIFont.systemFont(ofSize: 17)
        mSerialLabel.font = UIFont.systemFont(ofSize: 17)
        mStatusLabel.font = UIFont.systemFont(ofSize: 17)
        mColorLabel.font = UIFont.systemFont(ofSize: 17)
        mOwnerLabel.font = UIFont.systemFont(ofSize: 17)
        mDeptLabel.font = UIFont.systemFont(ofSize: 17)
        mLocationLabel.font = UIFont.systemFont(ofSize: 17)
        mFloorLabel.font = UIFont.systemFont(ofSize: 17)
        mIPLabel.font = UIFont.systemFont(ofSize: 17)
        
        mMakeModelLabel.sizeToFit()
        mTModelLabel.sizeToFit()
        mSerialLabel.sizeToFit()
        mStatusLabel.sizeToFit()
        mColorLabel.sizeToFit()
        mOwnerLabel.sizeToFit()
        mDeptLabel.sizeToFit()
        mFloorLabel.sizeToFit()
        mLocationLabel.sizeToFit()
        mIPLabel.sizeToFit()
        
        if(mSelectedPrinter?.status == "Active"){
            mStatusImage.image = UIImage(named: "ic_status_active.png")
        }else{
            mStatusImage.image = UIImage(named: "ic_status_inactive.png")
        }
        
        if(mSelectedPrinter?.color == "Color"){
            mColorImage.image = UIImage(named: "ic_color_cell.png")
        }else{
            mColorImage.image = UIImage(named: "ic_bw_cell.png")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     Passes Printer object to PrinterUpdateVC
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PrinterUpdateVC{
            vc.mSelectedPrinter = mSelectedPrinter
        }
    }

}
