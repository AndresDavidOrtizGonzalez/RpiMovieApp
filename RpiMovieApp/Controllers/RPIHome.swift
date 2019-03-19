//
//  RPIHome.swift
//  RpiMovieApp
//
//  Created by Andres Ortiz on 3/17/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class RPIHome: UITableViewController {
    
    //private let headerId = "CustomTableViewHeader"
    //private let footerId = "CustomTableViewFooter"
    private let cellId = "CustomMovieTableViewCell"
    

    var movies = [Movie]()
    var category : Int?
    var animationStyle : UITableView.RowAnimation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.category = 1
        self.animationStyle = .none
        
        setupViews()
        
        
        tableView.register(RpiCustomMovieTableCell.self, forCellReuseIdentifier: cellId)
        fetchData(kind: category!)
    }
    
    func fetchData(kind: Int){
        
        RPIMovieLoader.shared.fetchMovies(kind: kind){
            (result: [Movie], success) in
            if (success){
                if (self.movies.count > 0){
                    var indexPathToReload = [IndexPath]()
                    for cell in self.tableView.visibleCells{
                        indexPathToReload.append(self.tableView.indexPath(for: cell)!)
                    }
                    self.movies = result
                    self.tableView.reloadRows(at: indexPathToReload, with: self.animationStyle!)
                }
                else{
                    self.movies = result
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    @objc func changeCategory(sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex + 1 > self.category!)
        {
            self.animationStyle = UITableView.RowAnimation.left
        }
        else
        {
            self.animationStyle = UITableView.RowAnimation.right
        }
        
        switch sender.selectedSegmentIndex {
            case 0:
                print("Popular")
                self.category = 1;
            case 1:
                print("Top Rated")
                self.category = 2;
            case 2:
                print("Upcoming")
                self.category = 3;
            default:
                print("Popular")
                self.category = 1;
        }
        fetchData(kind:self.category!)
    }
    
    func setupViews(){
        let items = ["Popular", "Top Rated", "Upcoming"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        
        // Set up Frame and SegmentedControl
        let frame = view.bounds
        customSC.frame = CGRect(x: frame.minX + 10, y: frame.minY + 5,
                                width: frame.width - 20, height: 50)
        
        
        // Style the Segmented Control
        customSC.layer.cornerRadius = 5.0
        customSC.backgroundColor = .white
        customSC.tintColor = .blue
        
        // Add target action method
        customSC.addTarget(self, action: #selector(self.changeCategory(sender:)), for: .valueChanged)
        
        self.view.addSubview(customSC)

    }

    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  self.movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomMovieTableViewCell", for: indexPath) as! RpiCustomMovieTableCell

        let movie = movies[indexPath.row]
        
        /*let title = movie["title"] as! String
        let plot = movie["overview"] as! String
        let cover = movie["poster_path"] as! String
        let baseURL = "https://image.tmdb.org/t/p/w500"
        let url = URL(string: baseURL + cover)
        let placeholderImage = UIImage(named: "movieplaceholder")!*/
        
        //cell.imgMovieCover.af_setImage(withURL: url!, placeholderImage: placeholderImage)
        
        cell.imgMoviePoster.image = UIImage.init(named: "movieplaceholder")
        cell.lblMovieTitle.text = movie.title
        cell.lblMovieOverview.text = movie.overview
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
