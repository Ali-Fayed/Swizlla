//
//  SongsListViewController.swift
//  Swizlla
//
//  Created by Ali Fayed on 20/02/2021.
//

import UIKit

class SongsListViewController : UIViewController {

    @IBOutlet var table: UITableView!
    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }

}
