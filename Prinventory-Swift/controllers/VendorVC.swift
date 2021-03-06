
import UIKit

class VendorVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mEmptyView: UIView!
    @IBOutlet weak var mEmptyListImage: UIImageView!
    @IBOutlet weak var mEmptyListLabel: UILabel!
    
    @IBOutlet weak var mVendorTable: UITableView!

    var mVendorList = [Vendor]()
    
    var mDatabase: Database?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mDatabase = Database()
        mDatabase?.createTable()
        
        mEmptyView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        mEmptyListImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(88)
            make.width.equalTo(124)
        }
        
        mEmptyListLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(45)
            make.centerX.equalToSuperview()
            make.height.equalTo(27)
            make.width.equalTo(333)
        }
        
        mVendorTable.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        mEmptyListImage.image = UIImage(named: "ic_list_empty.png")
        mEmptyListLabel.text = "There are currently no vendors available to show"
        mEmptyListLabel.sizeToFit()
        
        hideTable()
        
        mVendorTable.rowHeight = 50
        mVendorTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getVendors()
        hideTable()
    }
    
    func getVendors(){

        mVendorList.removeAll()
        
        mVendorList = (mDatabase?.getVendors())!
        
        mVendorTable.reloadData()
        hideTable()
    }
    
    /**
     Hides TableView if list does not contain any vendors and shows "Empty List" comment
     */
    func hideTable(){
        if(mVendorList.count == 0){
            mEmptyView.isHidden = false
            mVendorTable.isHidden = true
        }else{
            mEmptyView.isHidden = true
            mVendorTable.isHidden = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mVendorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:VendorTableCell = mVendorTable.dequeueReusableCell(withIdentifier: "vendorCell") as! VendorTableCell
        
        let vendor = mVendorList[indexPath.row]
        
        cell.mIconImage.image = UIImage(named: "ic_vendor.png")
        
        cell.mNameLabel.text = vendor.name
        cell.mPhoneLabel.text = "Phone:  " + vendor.phone
        cell.mEmailLabel.text = "Email:   " + vendor.email
        
        cell.mNameLabel.sizeToFit()
        cell.mPhoneLabel.sizeToFit()
        cell.mEmailLabel.sizeToFit()
        
        return cell;
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        mVendorTable.setEditing(editing, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            let toBeDeleted = mVendorList[indexPath.row]
        
            mDatabase?.deleteVendor(rowId: toBeDeleted.id)

            mVendorList.remove(at: indexPath.row)
            mVendorTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)

        }
        hideTable()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "vendorDetailSegue", sender: mVendorList[indexPath.row])
    }
    
    /**
     Passes the selected vendor object from TableView row to the VendorDetailVC
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? VendorDetailVC{
            vc.mSelectedVendor = (sender as? Vendor)!
        }
    }

}
