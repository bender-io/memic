//
//  NewPostTableViewController.swift
//  Memic
//
//  Created by Brian Hersh on 5/31/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class NewPostTableViewController: UITableViewController {

    @IBOutlet weak var postSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MemeController.shared.gifs?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gifPickerCell", for: indexPath)
        let gif = MemeController.shared.gifs?[indexPath.row]
        MemeController.shared.fetchGifURL(searchTerm: <#T##String#>, completion: <#T##(([String]) -> Void)##(([String]) -> Void)##([String]) -> Void#>)

        return cell
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO
    }
}

extension NewPostTableViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        MemeController.shared.fetchGifURL(searchTerm: searchText) { (gifs) in
            MemeController.shared.gifs = gifs
            print(gifs)
        }
    }
}
