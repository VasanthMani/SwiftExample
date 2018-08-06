//
//  EventsDetailCell.swift
//  QTickets
//
//  Created by Mehboob on 5/21/18.
//  Copyright © 2018 360 Nautica. All rights reserved.
//

import UIKit

class TableDetailCell: UITableViewCell {

    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var aboveView: UIView!
    @IBOutlet weak var venue: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var bookNowOutlet: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        
        
    }
    func cinfigureCell(withEventDetails : NSDictionary)  {
        
        self.eventName.text = withEventDetails.value(forKey: "eventname") as? String
        
        self.venue.text = withEventDetails.value(forKey: "Venue") as? String
        
        self.eventDate.text = String(format: "%@ %@", (withEventDetails.value(forKey: "startDate") as? String)!,(withEventDetails.value(forKey: "StartTime") as? String)!)
        
//        self.eventImage.sd_setImage(with: URL(string: withEventDetails.value(forKey: "bannerURL") as! String), placeholderImage: UIImage(named: "placeholder-movie.png"))
        
        
        
    }
    
}
