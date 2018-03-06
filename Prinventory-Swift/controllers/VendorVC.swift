
import UIKit

class VendorVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mVendorTable: UITableView!
    
    @IBOutlet weak var mEmptyListLabel: UILabel!
    @IBOutlet weak var mEmptyListImage: UIImageView!

    var vendorList = [Vendor]()
    
    var mDatabase: Database?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mDatabase = Database()
        mDatabase?.createTable()
        
        mEmptyListImage.image = UIImage(named: "ic_list_empty.png")
        mEmptyListImage.isHidden = true
        
        mEmptyListLabel.text = "There are currently no vendors available to show"
        mEmptyListLabel.sizeToFit()
        mEmptyListLabel.isHidden = true
        
        hideTable()
        
        mVendorTable.rowHeight = 80
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
    
    func hideTable(){
        if(vendorList.count == 0){
            mVendorTable.isHidden = true
            mEmptyListImage.isHidden = false
            mEmptyListLabel.isHidden = false
        }else{
            mVendorTable.isHidden = false
            mEmptyListImage.isHidden = true
            mEmptyListLabel.isHidden = true
        }
    }
    
    func getVendors(){

        vendorList.removeAll()
        
        vendorList = (mDatabase?.getVendors())!
        
        mVendorTable.reloadData()
        hideTable()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vendorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:VendorTableCell = self.mVendorTable.dequeueReusableCell(withIdentifier: "vendorCell") as! VendorTableCell
        
        let vendor = vendorList[indexPath.row]
        
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
            
            let toBeDeleted = vendorList[indexPath.row]
        
            mDatabase?.deleteVendor(rowId: toBeDeleted.id)

            vendorList.remove(at: indexPath.row)
            mVendorTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)

        }
        hideTable()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "vendorDetailSegue", sender: vendorList[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? VendorDetailVC{
            vc.mSelectedVendor = (sender as? Vendor)!
        }
    }

}