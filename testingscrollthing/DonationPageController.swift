//
//  DonationPageController.swift
//  testingscrollthing
//
//  Created by Scholar on 8/2/22.
//

import UIKit
import LinkPresentation

class DonationPageController: UITableViewController {
    var articles : [AddArticle] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        articles = addArticles()
    }
    
    func addArticles() -> [AddArticle] {
        let first = AddArticle()
        first.articleLink = "https://www.nature.com/articles/d41586-022-01775-z"
        first.new = true
        let test = AddArticle()
        test.articleLink = "https://www.raywenderlich.com/7565482-visually-rich-links-tutorial-for-ios-image-thumbnails"
        test.image = "fake_rich_preview"
        return [first, test]
    }
    
    func openUrl(link: String!) {
        if let url = URL(string:link), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
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

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(articles[indexPath.row].image.count > 0) {
            return 250
        }
        return 40
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}