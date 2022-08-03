import UIKit
import LinkPresentation

class DonationPageController: UITableViewController {
    var articles : [AddArticle] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        articles = addArticles()
    }
    
    func addArticles() -> [AddArticle] {
        let test = AddArticle()
        test.articleLink = "https://www.weareplannedparenthood.org/onlineactions/2U7UN1iNhESWUfDs4gDPNg2?_ga=2.69621593.895029738.1659533675-44543167.1659533675"
        test.image = "IMG_0939"
        let testTwo = AddArticle()
        testTwo.articleLink = "https://wrrap.org/donate/"
        testTwo.image = "IMG_0940"
        let testThree = AddArticle()
        testThree.articleLink = "https://www.weareplannedparenthood.org/onlineactions/2U7UN1iNhESWUfDs4gDPNg2?_ga=2.69621593.895029738.1659533675-44543167.1659533675"
        testThree.image = "IMG_0941"
        return [test, testTwo, testThree]
    }
    
    func openUrl(link: String!) {
        if let url = URL(string:link), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }
    
    func getMetaData(url: String) {
        
        let provider = LPMetadataProvider()

        guard let url = URL(string: url) else { return }

        // Start fetching metadata
        provider.startFetchingMetadata(for: url) { metadata, error in
          guard
            let metadata = metadata,
            error == nil
            else { return }

          // Use the metadata
          print("Finding Metadata...")
          print(metadata.title ?? "No Title Found")
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let newOrOld = articles[indexPath.row]
        
        getMetaData(url: newOrOld.articleLink)
        
        let url = URL(string: newOrOld.articleLink)
        
        if(newOrOld.image.count > 0) {
            let newCell = cell as! MetadataTableViewCell
            newCell.metaDataImage!.image = UIImage(named: newOrOld.image)
            return newCell
        }
        else {
            if newOrOld.new {
                cell.textLabel?.text = "😀"+newOrOld.articleLink
            } else {
                cell.textLabel?.text = newOrOld.articleLink
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        openUrl(link: article.articleLink)
      }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(articles[indexPath.row].image.count > 0) {
            return 250
        }
        return 40
    }

}
