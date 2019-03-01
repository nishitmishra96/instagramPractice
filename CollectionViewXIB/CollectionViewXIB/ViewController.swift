import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var imgarr = [#imageLiteral(resourceName: "Unknown-6"),#imageLiteral(resourceName: "Unknown-7"),#imageLiteral(resourceName: "Unknown-2"),#imageLiteral(resourceName: "Unknown"),#imageLiteral(resourceName: "Unknown-4"),#imageLiteral(resourceName: "Unknown-9"),#imageLiteral(resourceName: "Unknown-3"),#imageLiteral(resourceName: "Unknown-1"),#imageLiteral(resourceName: "Unknown-8"),#imageLiteral(resourceName: "Unknown-5")]
    var lblarr = ["watch1","watch2","watch3","watch4","watch5","watch6","watch7","watch8","watch9","watch10"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lblarr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.img.image = imgarr[indexPath.row]
        cell.lbl.text = lblarr[indexPath.row]
        
        return cell
    }
    
    lazy var refresher : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .blue
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }()
    
    @objc func requestData() {
        let deadline = DispatchTime.now() + .milliseconds(800)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.refresher.endRefreshing() }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        collection.delegate = self
        collection.dataSource = self
        collection.refreshControl = refresher
    }
}
