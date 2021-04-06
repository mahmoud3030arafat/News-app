//
//  NewsViewController.swift
//  News
//
//  Created by Mahmoud on 11/5/20.
//  Copyright © 2020 mahmoud. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
      private var viewModel = NewsViewModel()
    override func viewDidLoad() {
        
        super.viewDidLoad()

        loadPopularMoviesData()
    tableView.delegate=self
        tableView.dataSource = self
     
    }
    private func loadPopularMoviesData() {
        viewModel.fetchPopularNewsData { [weak self] in
            self?.tableView.dataSource = self
              self?.tableView.reloadData()
          }
      }


}
    // MARK: - TableView
    
    extension NewsViewController: UITableViewDataSource,UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.numberOfRowsInSection(section: section)
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
            
            let movie = viewModel.cellForRowAt(indexPath: indexPath)
            cell.setCellWithValuesOf(movie)
            cell.isUserInteractionEnabled=true
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "go") as! SecondViewController
          
            //vc.imag = NewsTableViewCell.getImageDataFrom(<#T##self: NewsTableViewCell##NewsTableViewCell#>)
            self.navigationController?.pushViewController(vc, animated: true)
           
           


        }
       

      
        
      
 
       

}




