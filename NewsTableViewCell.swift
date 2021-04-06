//
//  NewsTableViewCell.swift
//  News
//
//  Created by Mahmoud on 11/5/20.
//  Copyright © 2020 mahmoud. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

   
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var poster: UIImageView!

    var urlString: String = ""
    // Setup movies values
       func setCellWithValuesOf(_ new:articles) {
        updateUI(discription: new.description, author: new.author,poster:new.poster)
       }
       
       // Update the UI Views
     func updateUI(discription:String?,author:String?,poster:String?) {
           
           self.discriptionLabel.text = discription
           self.authorLabel.text = author
        
       guard let poster = poster else {return}
        urlString = poster
        
       
       guard let posterImageURL = URL(string: urlString) else {
           self.poster.image = UIImage(named: "noImageAvailable")
           return
       }
       
       // Before we download the image we clear out the old one
       self.poster.image = nil
        
       getImageDataFrom(url: posterImageURL)
 
    }
    
    // MARK: - Get image data
        func getImageDataFrom(url: URL) {
          URLSession.shared.dataTask(with: url) { (data, response, error) in
              // Handle Error
              if let error = error {
                  print("DataTask error: \(error.localizedDescription)")
                  return
              }
              
              guard let data = data else {
                  // Handle Empty Data
                  print("Empty Data")
                  return
              }
              
              DispatchQueue.main.async {
                  if let image = UIImage(data: data) {
                      self.poster.image = image
                  }
              }
          }.resume()
      }

}
