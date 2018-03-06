
import UIKit

class TonerVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mTonerTable: UITableView!
    
    @IBOutlet weak var mEmptyListImage: UIImageView!
    @IBOutlet weak var mEmptyListLabel: UILabel!
    
    var tonerList = [Toner]()
    
    var mDatabase: Database?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mDatabase = Database()
        mDatabase?.createTable()
        
        mEmptyListImage.image = UIImage(named: "ic_list_empty.png")
        mEmptyListImage.isHidden = true
        
        mEmptyListLabel.text = "There are currently no toners available to show"
        mEmptyListLabel.sizeToFit()
        mEmptyListLabel.isHidden = true
        
        hideTable()
        
        mTonerTable.rowHeight = 90
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
    
    func hideTable(){
        if(tonerList.count == 0){
            mTonerTable.isHidden = true
            mEmptyListImage.isHidden = false
            mEmptyListLabel.isHidden = false
        }else{
            mTonerTable.isHidden = false
            mEmptyListImage.isHidden = true
            mEmptyListLabel.isHidden = true
        }
    }
    
    func getToners(){

        tonerList.removeAll()
        
        tonerList = (mDatabase?.getToners())!
        
        mTonerTable.reloadData()
        hideTable()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tonerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TonerTableCell = self.mTonerTable.dequeueReusableCell(withIdentifier: "tonerCell") as! TonerTableCell
        
        let toner = tonerList[indexPath.row]
        
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
    
            let toBeDeleted = tonerList[indexPath.row]
            mDatabase?.deleteToner(rowId: toBeDeleted.id)
            
            tonerList.remove(at: indexPath.row)
            mTonerTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
        }
        hideTable()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "tonerDetailSegue", sender: tonerList[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TonerDetailVC{
            vc.mSelectedToner = (sender as? Toner)!
        }
    }
}
