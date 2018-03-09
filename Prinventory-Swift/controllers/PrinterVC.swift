
import UIKit

class PrinterVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate {

    var mPrinterList = [Printer]()
    
    var mDatabase: Database?
    
    @IBOutlet weak var mPrinterTable: UITableView!
    @IBOutlet weak var mEmptyListImage: UIImageView!
    @IBOutlet weak var mEmptyListLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mDatabase = Database()
        mDatabase?.createTable()
        
        mEmptyListImage.image = UIImage(named: "ic_list_empty.png")
        mEmptyListImage.isHidden = true
       
        mEmptyListLabel.text = "There are currently no printers available to show"
        mEmptyListLabel.sizeToFit()
        mEmptyListLabel.isHidden = true
        
        hideTable()
        
        mPrinterTable.rowHeight = 90
        mPrinterTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getPrinters()
        hideTable()
    }
    
    func hideTable(){
        if(mPrinterList.count == 0){
            mPrinterTable.isHidden = true
            mEmptyListImage.isHidden = false
            mEmptyListLabel.isHidden = false
        }else{
            mPrinterTable.isHidden = false
            mEmptyListImage.isHidden = true
            mEmptyListLabel.isHidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func getPrinters(){
        
        mPrinterList.removeAll()
        
        mPrinterList = (mDatabase?.getPrinters())!
        
        mPrinterTable.reloadData()
        hideTable()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mPrinterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:PrinterTableCell = mPrinterTable.dequeueReusableCell(withIdentifier: "printerCell") as! PrinterTableCell
        
        let printer = mPrinterList[indexPath.row]
        
        cell.mIconImage.image = UIImage(named: "ic_printer.png")
        
        cell.mMakeLabel.text = printer.make + " " + printer.model
        cell.mLocationLabel.text = "Location:    " + printer.location
        cell.mIPLabel.text = "IP:    " + printer.ip
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PrinterDetailVC{
            vc.mSelectedPrinter = (sender as? Printer)!
        }
    }

}
