//
//  ViewController.swift
//  WordPressComment
//
//  Created by omur olgunay on 18.07.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class CommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - IBVariables
    var comments: [Comment] = []
    
    //MARK: - IBOutlets
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.tableFooterView = UIView()
        
        getComments()
        
    }
    
    //MARK: - TableView Funcs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCellid") as! CommentTableViewCell
        cell.commentLabel.text = comments[indexPath.row].comment_content
        cell.commentDate.text = comments[indexPath.row].comment_date
        if comments[indexPath.row].comment_author == ""{
            cell.commentAuthor.text = "Anonim"
        }else{
            cell.commentAuthor.text = comments[indexPath.row].comment_author
        }
        return cell
    }

    //MARK: - Functions
    func getComments(){
        AF.request("https://kpssevi.com/wp-json/kph/v1&secretKey=\(secretKey)&appID=\(appID)/comments").responseJSON { response in
            if let json = response.data{
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([Comment].self, from: json)
                    self.comments = result
                    self.table.reloadData()
                }catch{
                    print(error)
                }
            }
        }
    }
    
}

