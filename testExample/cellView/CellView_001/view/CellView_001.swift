//
//  CellView_001.swift
//  openweathermap
//
//  Created by SatangBiiger Jaydeestan on 20/12/2563 BE.
//

import UIKit

class CellView_001: UITableViewCell {
    @IBOutlet weak var labelFirst: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelThird: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
