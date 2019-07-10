import UIKit

class FBDetailVC: UIViewController {
    
    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var anonyBtn: UIButton!
    @IBOutlet weak var applyBtn: UIButton!
    
    
    
    var detailImage: UIImage?
    var postTitle: String?
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postProfileImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var commentCount: UIButton!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var thumbsUpBtn: UIButton!
    @IBOutlet weak var thumbsDownBtn: UIButton!
    
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContents()
        // Do any additional setup after loading the view.
        
        anonyBtn.layer.borderWidth = 1
        anonyBtn.layer.cornerRadius = 3
        anonyBtn.layer.borderWidth = 1
        
        self.commentView.frame = CGRect(x: 0, y: 611, width: self.commentView.frame.size.width, height: self.commentView.frame.size.height)

    }
    
    func setContents(){
        postImage.image = detailImage
        postTitleLabel.text = postTitle
        
    }
    
}
