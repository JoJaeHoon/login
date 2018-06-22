import UIKit
import RealmSwift

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let realm = try! Realm()
    var list : Results<Contents>!
    var index = 0
    //static var tblTest: UITableView?
    static var shared: ViewController2?
    @IBOutlet weak var contentsTable: UITableView!
    
    override func viewDidLoad() {
        contentsTable.delegate = self
        contentsTable.dataSource = self
        //ViewController2.tblTest = contentsTable
        
        ViewController2.shared = self
        
        if list == nil {
            list = realm.objects(Contents.self)
        }
        
        super.viewDidLoad()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCellTableViewCell", for: indexPath) as! testCellTableViewCell
        
        cell.comment.text = list[indexPath.row].comment
        let url : String = "http://www.labty.net/images/reg/2018-05-09/IMG_20180426_051917.jpg"
        let imageUrl = URL(string: url)
        let image = try? Data(contentsOf: imageUrl!)
        
        let imageResize : UIImage = self.resizeImage(image: UIImage(data: image!)!, targetSize: CGSize(width: 110, height: 110))
        
        if image != nil {
            cell.cellImage.image = imageResize
        }
        
        return cell
    }
    
    /// 이미지 사이즈 조정
    ///
    /// - Parameters:
    ///   - image: before image object
    ///   - targetSize: after size
    /// - Returns: UIImage
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let width = targetSize.width / size.width
        let height = targetSize.height / size.height
        
        var newSize : CGSize
        
        newSize = CGSize(width: size.width * width, height: size.height * height)
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height : CGFloat = 100
        return height
    }
    
//    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        index = indexPath.row
//
//        try! realm.write {
//            realm.delete(list[index])
//        }
//
//        contentsTable.reloadData()
//    }
    
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        index = indexPath.row
        
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            try! realm.write {
                realm.delete(list[index])
            }
            contentsTable.reloadData()
        }
    }
    
}
