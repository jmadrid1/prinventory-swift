
import UIKit
import SnapKit

class PrinterVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate {

    @IBOutlet weak var mEmptyView: UIView!
    @IBOutlet weak var mEmptyListImage: UIImageView!
    @IBOutlet weak var mEmptyListLabel: UILabel!
    
    @IBOutlet weak var mPrinterTable: UITableView!
    
    var mPrinterList = [Printer]()
    
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
        
        mPrinterTable.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        mEmptyListImage.image = UIImage(named: "ic_list_empty.png")
        mEmptyListLabel.text = "There are currently no printers available to show"
        mEmptyListLabel.sizeToFit()
        
        hideTable()
        
        mPrinterTable.rowHeight = 50
        mPrinterTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getPrinters()
        hideTable()
    }
    
    func getPrinters(){
        
        mPrinterList.removeAll()
        
        mPrinterList = (mDatabase?.getPrinters())!
        
        mPrinterTable.reloadData()
        hideTable()
    }
    
    /**
     Hides TableView if list does not contain any printers and shows "Empty List" comment
     */
    func hideTable(){
        if(mPrinterList.count == 0){
            mEmptyView.isHidden = false
            mPrinterTable.isHidden = true
        }else{
            mEmptyView.isHidden = true
            mPrinterTable.isHidden = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mPrinterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:PrinterTableCell = mPrinterTable.dequeueReusableCell(withIdentifier: "printerCell") as! PrinterTableCell
        
        let printer = mPrinterList[indexPath.row]
        
        
        cell.mMakeLabel.text = printer.make + " " + printer.model
        cell.mLocationLabel.text = "Location:    " + printer.location
        cell.mIPLabel.text = "IP:  " + printer.ip

        cell.mMakeLabel.sizeToFit()
        cell.mLocationLabel.sizeToFit()
        cell.mIPLabel.sizeToFit()
        
        if(printer.status == "Active"){
            cell.mStatusImage.image = UIImage(named: "ic_status_active.png")
        }else{
            cell.mStatusImage.image = UIImage(named: "ic_status_inactive.png")
        }
        
        if(printer.color == "Color"){
            cell.mColorImage.image = UIImage(named: "ic_color_cell.png")
        }else{
            cell.mColorImage.image = UIImage(named: "ic_bw_cell.png")
        }

        return cell;
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        mPrinterTable.setEditing(editing, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            let toBeDeleted = mPrinterList[indexPath.row]
            
            mDatabase?.deletePrinter(rowId: toBeDeleted.id)
            
            mPrinterList.remove(at: indexPath.row)
            mPrinterTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
        hideTable()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "printerDetailSegue", sender: mPrinterList[indexPath.row])
    }
    
    /**
     Passes the selected printer object from TableView row to the PrinterDetailVC
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PrinterDetailVC{
            vc.mSelectedPrinter = (sender as? Printer)!
        }
    }

}
