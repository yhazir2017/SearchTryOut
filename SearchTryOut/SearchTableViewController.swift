//
//  SearchTableViewController.swift
//  SearchTryOut
//
//  Created by YILDIRAY HAZIR on 9/6/17.
//  Copyright © 2017 thunder. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var searchItems = ["Elif","Semin","Sena","Sevilay","Neslihan","Erdem","Emin"]
    var filteredItems = [String]()
    
    var searchController : UISearchController!
    var resultsController = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchController = UISearchController(searchResultsController: self.resultsController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        self.filteredItems = self.searchItems.filter{(item : String)->Bool in
            if item.lowercased().contains(self.searchController.searchBar.text!.lowercased()){
                return true
            }
            else{
                return false
            }
        }
        self.resultsController.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView{
            return self.searchItems.count
        } else{
            return self.filteredItems.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if tableView == self.tableView{
            cell.textLabel?.text = self.searchItems[indexPath.row]
            cell.textLabel?.textColor = UIColor.blue
            cell.textLabel?.textAlignment = .center
        }
        else{
            cell.textLabel?.text = self.filteredItems[indexPath.row]
            cell.textLabel?.textColor = UIColor.red
            cell.textLabel?.textAlignment = .right
        }
        return cell
    }
}
