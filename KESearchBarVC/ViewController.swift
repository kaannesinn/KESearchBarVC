//
//  ViewController.swift
//  KESearchBarVC
//
//  Created by Kaan Esin on 4.02.2020.
//  Copyright © 2020 Kaan Esin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    @IBOutlet weak var searchTableView: UITableView!
    let searchVC = UISearchController(searchResultsController: nil)
    var searchedWords: [String] = []
    var words = ["Ali", "Veli", "Barış", "Bartu", "Cem", "Zeynep", "Cihan"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchVC.searchResultsUpdater = self
        searchVC.hidesNavigationBarDuringPresentation = false
        searchVC.dimsBackgroundDuringPresentation = false
        
        searchTableView.tableHeaderView = searchVC.searchBar
//        navigationItem.titleView = searchVC.searchBar
        
        searchedWords = words
        searchTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = searchedWords[indexPath.row]
        return cell
    }

    func updateSearchResults(for searchController: UISearchController) {
        searchedWords.removeAll()

        if searchController.searchBar.text?.count == 0 {
            searchedWords = words
        }
        else {
            for word in words {
                if (word.lowercased() as! NSString).range(of: (searchController.searchBar.text?.lowercased() ?? "")).length > 0 {
                    searchedWords.append(word)
                }
            }
        }
        
        searchTableView.reloadData()
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        guard var rect = searchTableView.tableHeaderView?.frame else { return }
//        rect.origin.y = min(0, searchTableView.contentOffset.y)
//        searchTableView.tableHeaderView?.frame = rect
//    }
}

