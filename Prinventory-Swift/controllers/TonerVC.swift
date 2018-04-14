
import UIKit

class TonerVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mEmptyView: UIView!
    @IBOutlet weak var mEmptyListImage: UIImageView!
    @IBOutlet weak var mEmptyListLabel: UILabel!
    
    @IBOutlet weak var mTonerTable: UITableView!
    
    var mTonerList = [Toner]()
    
    var mDatabase: Database?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mDatabase = Database()
        mDatabase?.createTable()
        
        mEmptyListImage.image = UIImage(named: "ic_list_empty.png")
        mEmptyListLabel.text = "There are currently no toners available to show"
        mEmptyListLabel.sizeToFit()
        
        hideTable()
        
        mTonerTable.rowHeight = 50
        mTonerTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getToners()
        hideTable()
    }
    
    func getToners(){

        mTonerList.removeAll()
        
        mTonerList = (mDatabase?.getToners())!
        
        mTonerTable.reloadData()
        hideTable()
    }
    
    /**
     Hides TableView if list does not contain any toners and shows "Empty List" comment
     */
    func hideTable(){
        if(mTonerList.count == 0){
            mEmptyView.isHidden = false
            mTonerTable.isHidden = true
        }else{
            mEmptyView.isHidden = true
            mTonerTable.isHidden = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mTonerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TonerTableCell = mTonerTable.dequeueReusableCell(withIdentifier: "tonerCell") as! TonerTableCell
        
        let toner = mTonerList[indexPath.row]
        
        cell.mMakeModelLabel.text = toner.make + " " + toner.model
        cell.mTModelLabel.text = toner.tmodel
        
        if(toner.color == "Color"){
            cell.mColorImage.image = UIImage(named: "ic_color_cell.png")
        }else{
            cell.mColorImage.image = UIImage(named: "ic_bw_cell.png")
        }
        return cell;
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        mTonerTable.setEditing(editing, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
    
            let toBeDeleted = mTonerList[indexPath.row]
            mDatabase?.deleteToner(rowId: toBeDeleted.id)
            
            mTonerList.remove(at: indexPath.row)
            mTonerTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
        }
        hideTable()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "tonerDetailSegue", sender: mTonerList[indexPath.row])
    }
    
    /**
     Passes the selected toner object from TableView row to the TonerDetailVC
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TonerDetailVC{
            vc.mSelectedToner = (sender as? Toner)!
        }
    }
}
