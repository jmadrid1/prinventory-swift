
import Foundation
import SQLite

class Database{
    
    var database: Connection!
    
    let mId = Expression<Int>("id")
    
    let mPrinterTable = Table("printers")
    let mMake_Printer = Expression<String>("make")
    let mModel_Printer = Expression<String>("model")
    let mTModel_Printer = Expression<String>("tmodel")
    let mSerial_Printer = Expression<String>("serial")
    let mStatus_Printer = Expression<String>("status")
    let mColor_Printer = Expression<String>("color")
    let mOwner_Printer = Expression<String>("owner")
    let mDept_Printer = Expression<String>("dept")
    let mLocation_Printer = Expression<String>("location")
    let mFloor_Printer = Expression<String>("floor")
    let mIp_Printer = Expression<String>("ip")
    
    let mTonerTable = Table("toners")
    let mMake_Toner = Expression<String>("make")
    let mModel_Toner = Expression<String>("model")
    let mTModel_Toner = Expression<String>("tmodel")
    let mColor_Toner = Expression<String>("color")
    let mBlack_Toner = Expression<Double>("black")
    let mCyan_Toner = Expression<Double>("cyan")
    let mYellow_Toner = Expression<Double>("yellow")
    let mMagenta_Toner = Expression<Double>("magenta")
    
    let mVendorTable = Table("vendors")
    let mName_Vendor = Expression<String>("name")
    let mPhone_Vendor = Expression<String>("phone")
    let mEmail_Vendor = Expression<String>("email")
    let mStreet_Vendor = Expression<String>("street")
    let mCity_Vendor = Expression<String>("city")
    let mState_Vendor = Expression<String>("state")
    let mZipcode_Vendor = Expression<String>("zipcode")
    
    init() {
        prepDatabase()
    }
    
    func prepDatabase(){
        do{
            let documentDictionary = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUri = documentDictionary.appendingPathComponent("prinventory").appendingPathExtension("sqlite3")
            let database = try Connection(fileUri.path)
            self.database = database
        }catch{
            print(error)
        }
    }
    
    /**
     Creates the database schema for Prinventory
    */
    func createTable(){
        
        var createTable = mPrinterTable.create {
            (table) in
            table.column(mId, primaryKey: true)
            table.column(mMake_Printer)
            table.column(mModel_Printer)
            table.column(mTModel_Printer)
            table.column(mSerial_Printer)
            table.column(mStatus_Printer)
            table.column(mColor_Printer)
            table.column(mOwner_Printer)
            table.column(mDept_Printer)
            table.column(mLocation_Printer)
            table.column(mFloor_Printer)
            table.column(mIp_Printer)
        }
        do{
            try self.database.run(createTable)
        } catch {
            print(error)
        }
        
        createTable = mTonerTable.create {
            (table) in
            table.column(mId, primaryKey: true)
            table.column(mMake_Toner)
            table.column(mModel_Toner)
            table.column(mTModel_Toner)
            table.column(mColor_Toner)
            table.column(mBlack_Toner)
            table.column(mCyan_Toner)
            table.column(mYellow_Toner)
            table.column(mMagenta_Toner)
        }
        do{
            try self.database.run(createTable)
        } catch {
            print(error)
        }
        
        createTable = mVendorTable.create {
            (table) in
            table.column(mId, primaryKey: true)
            table.column(mName_Vendor)
            table.column(mPhone_Vendor)
            table.column(mEmail_Vendor)
            table.column(mStreet_Vendor)
            table.column(mCity_Vendor)
            table.column(mState_Vendor)
            table.column(mZipcode_Vendor)
        }
        do{
            try self.database.run(createTable)
        } catch {
            print(error)
        }
    }
    
    func getPrinters() -> Array<Printer>{
        
        var printers: [Printer] = [];
        
        do{
            let list = try self.database.prepare(mPrinterTable)
            for printer in list {
                let newPrinter = Printer(id: printer[mId],
                                         make: printer[mMake_Printer],
                                         model: printer[mModel_Printer],
                                         tmodel: printer[mTModel_Printer],
                                         serial: printer[mSerial_Printer],
                                         status: printer[mStatus_Printer],
                                         color: printer[mColor_Printer],
                                         owner: printer[mOwner_Printer],
                                         department: printer[mDept_Printer],
                                         location: printer[mDept_Printer],
                                         floor: printer[mFloor_Printer],
                                         ip: printer[mIp_Printer])
                
                printers.append(newPrinter)
            }
        }catch{
            print(error)
        }
        return printers
    }
    
    func addPrinter(make: String, model: String, tmodel: String, serial: String, status: String, color: String, owner: String, department: String, location: String, floor: String, ip: String){
        
        let insertPrinter = mPrinterTable.insert(mMake_Printer <- make,
                                                     mModel_Printer <- model,
                                                     mTModel_Printer <- tmodel,
                                                     mSerial_Printer <- serial,
                                                     mStatus_Printer <- status,
                                                     mColor_Printer <- color,
                                                     mOwner_Printer <- owner,
                                                     mDept_Printer <- department,
                                                     mLocation_Printer <- location,
                                                     mFloor_Printer <- floor,
                                                     mIp_Printer <- ip)
        do{
            try self.database.run(insertPrinter)
        }catch{
            print(error)
        }
    }
    
    func updatePrinter(id: Int, make: String, model: String, tmodel: String, serial: String, status: String, color: String, owner: String, department: String, location: String, floor: String, ip: String){
        
        let printer = mPrinterTable.filter(mId == id)
        let updatePrinter = printer.update(mMake_Printer <- make,
                                            mModel_Printer <- model,
                                            mTModel_Printer <- tmodel,
                                            mSerial_Printer <- serial,
                                            mStatus_Printer <- status,
                                            mColor_Printer <- color,
                                            mOwner_Printer <- owner,
                                            mDept_Printer <- department,
                                            mLocation_Printer <- location,
                                            mFloor_Printer <- floor,
                                            mIp_Printer <- ip)
        
        do{
            try self.database.run(updatePrinter)
        }catch{
            print(error)
        }
    }
    
    func deletePrinter(rowId: Int ){
        
        let printer = mPrinterTable.filter(mId == rowId)
        let deleteQuery = printer.delete()
        
        do{
            try self.database.run(deleteQuery)
        }catch{
            print(error)
        }
    }
    
    func getToners() -> Array<Toner>{
        
        var toners: [Toner] = [];
        
        do{
            let list = try self.database.prepare(mTonerTable)
            for toner in list {
                let newToner = Toner(id: toner[mId],
                                     make: toner[mMake_Toner],
                                     model: toner[mModel_Toner],
                                     tmodel: toner[mTModel_Toner],
                                     color: toner[mColor_Toner],
                                     black: toner[mBlack_Toner],
                                     cyan: toner[mCyan_Toner],
                                     yellow: toner[mYellow_Toner],
                                     magenta: toner[mMagenta_Toner])
                
                toners.append(newToner)
            }
        }catch{
            print(error)
        }
        return toners
    }
    
    func addToner(make: String, model: String, tmodel: String, color: String, black: Double, cyan: Double, yellow: Double, magenta: Double){
        
        let insertToner = mTonerTable.insert(mMake_Toner <- make,
                                                 mModel_Toner <- model,
                                                 mTModel_Toner <- tmodel,
                                                 mColor_Toner <- color,
                                                 mBlack_Toner <- black,
                                                 mCyan_Toner <- cyan,
                                                 mYellow_Toner <- yellow,
                                                 mMagenta_Toner <- magenta)
        
        do{
            try self.database.run(insertToner)
        }catch{
            print(error)
        }
    }
    
    func updateToner(id: Int, make: String, model: String, tmodel: String, color: String, black: Double, cyan: Double, yellow: Double, magenta: Double){
        
        let toner = mTonerTable.filter(mId == id)
        let updateToner = toner.update(mMake_Toner <- make,
                                        mModel_Toner <- model,
                                        mTModel_Toner <- tmodel,
                                        mColor_Toner <- color,
                                        mBlack_Toner <- black,
                                        mCyan_Toner <- cyan,
                                        mYellow_Toner <- yellow,
                                        mMagenta_Toner <- magenta)
        
        do{
            try self.database.run(updateToner)
        }catch{
            print(error)
        }
    }
    
    func deleteToner(rowId: Int ){
        
        let toner = mTonerTable.filter(mId == rowId)
        let deleteQuery = toner.delete()
        
        do{
            try self.database.run(deleteQuery)
        }catch{
            print(error)
        }
    }
    
    func getVendors() -> Array<Vendor>{
        
        var vendors: [Vendor] = [];
        
        do{
            let list = try self.database.prepare(mVendorTable)
            for vendor in list {
                let newVendor = Vendor(id: vendor[mId],
                                       name: vendor[mName_Vendor],
                                       phone: vendor[mPhone_Vendor],
                                       email: vendor[mEmail_Vendor],
                                       street: vendor[mStreet_Vendor],
                                       city: vendor[mCity_Vendor],
                                       state: vendor[mState_Vendor],
                                       zipcode: vendor[mZipcode_Vendor])
                
                vendors.append(newVendor)
            }
        }catch{
            print(error)
        }
        return vendors
    }
    
    func addVendor(name: String, phone: String, email: String, street: String, city: String, state: String, zipcode: String){
        
        let insertVendor = mVendorTable.insert(mName_Vendor <- name,
                                                   mPhone_Vendor <- phone,
                                                   mEmail_Vendor <- email,
                                                   mStreet_Vendor <- street,
                                                   mCity_Vendor <- city,
                                                   mState_Vendor <- state,
                                                   mZipcode_Vendor <- zipcode)
        
        do{
            try self.database.run(insertVendor)
        }catch{
            print(error)
        }
    }
    
    func updateVendor(id: Int, name: String, phone: String, email: String, street: String, city: String, state: String, zipcode: String){
        
        let vendor = mVendorTable.filter(mId == id)
        let updateVendor = vendor.update(mName_Vendor <- name,
                                          mPhone_Vendor <- phone,
                                          mEmail_Vendor <- email,
                                          mStreet_Vendor <- street,
                                          mCity_Vendor <- city,
                                          mState_Vendor <- state,
                                          mZipcode_Vendor <- zipcode)
        
        do{
            try self.database.run(updateVendor)
        }catch{
            print(error)
        }
    }
    
    func deleteVendor(rowId: Int ){
        
        let vendor = mVendorTable.filter(mId == rowId)
        let deleteQuery = vendor.delete()
        
        do{
            try self.database.run(deleteQuery)
        }catch{
            print(error)
        }
    }
    
}
