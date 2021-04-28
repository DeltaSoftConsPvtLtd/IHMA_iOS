//
//  SideMenuViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 22/04/21.
//

import UIKit


class SideMenuViewController: BaseViewController {

    
    @IBOutlet weak var viewTable: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var txtLabel: UILabel!{
        didSet{
            txtLabel.text = "Choose Your Courses"
            txtLabel.font = setFontRegular(20.0)
            txtLabel.textColor = UIColor.white
        }
    }
    let courses = [["SoH", "CECP", "MOST"],
                 ["Objective C", "Android"],
                 ["Photoshop"]]
    
    var tableDataSurce : TableDataSource?
    
    @IBOutlet weak var coursesTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        sideMenu()
        
        self.tableDataSurce = TableDataSource(attachView: self)
        
    }
    
    //MARK:- Search results
    func getsearchResults() {
      
    }
    
        
   
    
    func updateUI() {
        searchView.layer.cornerRadius = searchView.bounds.height/2;
        searchView.clipsToBounds  =  true
        viewTable.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
        viewTable.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"176AB5")
        
        searchTextField.borderStyle = .none
        
        
    }


}

//MARK:- Change color of image
extension UIImageView {
    @IBInspectable
    var changeColor: UIColor? {
        get {
            let color = UIColor(cgColor: layer.borderColor!);
            return color
        }
        set {
            let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
            self.image = templateImage
            self.tintColor = newValue
        }
    }
}


//MARK:-List items for side menu
class MenuListController: UITableViewController {
    var items = ["Profile","Login", "Register","Payment","Privacy policy"]
    let darkcolor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"0E589D")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
          cell.imageView?.image = UIImage(named: "userwhiteimage")
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = cell.textLabel?.font.withSize(20)
        cell.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"0E589D")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row
        {
        case 0:
            break
        case 1:
            let destinationController = LoginViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
            self.navigationController?.pushViewController(destinationController!, animated: true)
            
        case 2:
            let destinationController = RegistrationViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
            self.navigationController?.pushViewController(destinationController!, animated: true)
        case 3:
            let destinationController = PaymentViewController .instantiateViewControllerFromStoryboard(storyBoardName: "PaymentScreens")
            self.navigationController?.pushViewController(destinationController!, animated: true)
        default:
            print("ll")
        }
//
        
        
    }
}
