//
//  CommentTableViewCell.swift
//  WordPressComment
//
//  Created by omur olgunay on 18.07.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    //MARK: - IBOutlest
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentAuthor: UILabel!
    @IBOutlet weak var commentDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
