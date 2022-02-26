//
//  TableViewCell.swift
//  MovieDb-AF
//
//  Created by Nurşah on 26.02.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
