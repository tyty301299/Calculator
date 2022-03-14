//
//  ClickCollCell.swift
//  Calculator
//
//  Created by Nguyen Ty on 08/09/2021.
//

import UIKit

class ClickCollCell: UICollectionViewCell {
    var colornumber = UIColor(red: 229/255, green: 134/255, blue: 124/255, alpha: 1)
    @IBOutlet weak var lbnumber: UILabel!
    @IBOutlet weak var viewcell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupviewcell()
        setuplable()
    }
    func setupviewcell() {
        viewcell.layer.masksToBounds = true
        viewcell.layer.cornerRadius = 20
        viewcell.backgroundColor = colornumber
 
    }
    func setuplable() {
        lbnumber.textColor = .white
        lbnumber.font = UIFont.boldSystemFont(ofSize: 40)
    }

}
