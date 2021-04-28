//
//  CheckBoxTableViewCell.swift
//  ProyectoPruebaiOS
//
//  Created by Kenneth on 26/04/21.
//

import UIKit

class CheckBoxTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    var flag = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkMark(_ sender: UIButton) {

        if flag == false {
            sender.setBackgroundImage(UIImage(named: "checkbox"), for: UIControl.State.normal)
            flag = true

        } else {
            sender.setBackgroundImage(UIImage(named: "uncheckbox"), for: UIControl.State.normal)
            flag = false
        }
    }
    
}
