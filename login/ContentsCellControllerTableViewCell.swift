//
//  ContentsCellControllerTableViewCell.swift
//  login
//
//  Created by imgtech on 2018. 5. 7..
//  Copyright © 2018년 jjh. All rights reserved.
//

import UIKit

class ContentsCellControllerTableViewCell: UITableViewCell {


    func tableView(tableView : UITableView, numberOfRowsInSection section : Int) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentsCell", for: <#T##IndexPath#>)
        
    }
}

