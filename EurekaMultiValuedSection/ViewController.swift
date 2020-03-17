//
//  ViewController.swift
//  EurekaMultiValuedSection
//
//  Created by Hien Pham on 3/17/20.
//  Copyright © 2020 BraveSoft Vietnam. All rights reserved.
//

import UIKit
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpForm()
    }

    func setUpForm() {
        tableView.estimatedSectionHeaderHeight = 20
        
        form +++ MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete],
                                    header: "Multivalued TextField",
                                    footer: ".Insert adds a 'Add Item' (Add New Tag) button row as last cell.") {
$0.addButtonProvider = { section in
    return ButtonRow("AddButtonRow"){
        $0.title = "Add New Tag"
        $0.cellProvider = CellProvider<ButtonCell>(nibName: "MyButtonCell", bundle: Bundle.main)
    }
}
                                        $0.multivaluedRowToInsertAt = { index in
                                            return NameRow() {
                                                $0.placeholder = "Tag Name"
                                            }
                                        }
                                        $0 <<< NameRow() {
                                            $0.placeholder = "Tag Name"
                                        }
        }

    }

override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    let row = form.allSections[indexPath.section].allRows[indexPath.row]
    if row.tag == "AddButtonRow" {
        return nil
    }
    return indexPath
}
}
