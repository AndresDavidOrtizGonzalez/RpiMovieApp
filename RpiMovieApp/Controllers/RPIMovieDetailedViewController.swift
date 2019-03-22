//
//  RPIMovieDetailedViewController.swift
//  movieTest
//
//  Created by Andres Ortiz on 5/10/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit
import YouTubePlayer

class RPIMovieDetailedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var movie: RPIMovie?
    var videoURL: String?
    var aiLoader: UIActivityIndicatorView?
    
    @IBOutlet weak var tvMovie: UITableView!
    
    @IBAction func goBackAction(_ sender: Any){
        performSegue(withIdentifier: "goBackToHomeFromDetailed", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tvMovie.backgroundColor = .black
        self.tvMovie.delegate = self
        self.tvMovie.dataSource = self
        self.videoURL = ""
        self.navigationItem.title = movie!.title!
        self.aiLoader = UIActivityIndicatorView()
        self.aiLoader?.frame = CGRect(x: (UIScreen.main.bounds.width/2), y: (UIScreen.main.bounds.width/2), width: 20, height: 20)
        self.aiLoader?.startAnimating()
        self.aiLoader?.tintColor = UIColor.black
        self.view.addSubview(self.aiLoader!)
        self.view.bringSubviewToFront(self.aiLoader!)
        self.tvMovie.separatorStyle = .none
        fetchMovieVideo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchMovieVideo()
    {

        let url = NSURL(string: "https://api.themoviedb.org/3/movie/\(movie!.id!)/videos?api_key=30f03a109d382c80fe5ef86868633ff7")

        let request = URLRequest(url: url! as URL)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
                
            }
            
            /* responseString = String(data: data, encoding: .utf8)
             print("responseString = \(responseString)")*/
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                if ((json["results"] as! [NSDictionary]).isEmpty)
                {
                    self.videoURL = "FJkr_TwfwZg"
                }
                else
                {
                    let video = (json["results"] as! [NSDictionary])[0]
                    self.videoURL = (video["key"] as! String)
                }

                DispatchQueue.main.async {
                    self.aiLoader?.isHidden = true
                    self.tvMovie.reloadData()
                }
                
            }catch {
                print(error)
            }
            
        }
        task.resume()
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat
        switch indexPath.row {
        case 0:
            height = CGFloat(UIScreen.main.bounds.width / 1.33)
        case 1:
            height = 60.0
        case 2:
            height = CGFloat(UIScreen.main.bounds.height/3)
        case 3:
            height = 80.0
        default:
            height = 0.0
        }

        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieDetailedCell", for: indexPath)
        switch indexPath.row {
        case 0:
            let videoPlayer = YouTubePlayerView(frame: cell.frame)
            if (self.videoURL != "")
            {
                videoPlayer.loadVideoID(self.videoURL!)
            }
            videoPlayer.backgroundColor = UIColor.black
            cell.backgroundColor = UIColor.black
            cell.addSubview(videoPlayer)
        case 1:
            let lblTitle = UILabel()
            lblTitle.frame = CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width - 10, height: cell.frame.height)
            lblTitle.text = movie!.title! + " (" + movie!.year! + ")"
            lblTitle.font = UIFont.systemFont(ofSize: 28, weight: .thin)
            lblTitle.numberOfLines = 0
            lblTitle.backgroundColor = UIColor.black
            lblTitle.textColor = UIColor.white
            cell.backgroundColor = UIColor.black
            cell.addSubview(lblTitle)
        case 2:
            let imgCover : UIImageView
            imgCover = UIImageView()
            imgCover.frame = CGRect(x:20, y: 10, width: (UIScreen.main.bounds.width/3), height: (UIScreen.main.bounds.height/3)-20)
            imgCover.contentMode = .scaleAspectFit
            let baseURL = "https://image.tmdb.org/t/p/w500"
            let url = URL(string: baseURL + movie!.cover!)
            let placeholderImage = UIImage(named: "movieplaceholder")!
            imgCover.af_setImage(withURL: url!, placeholderImage: placeholderImage)
            cell.addSubview(imgCover)
            
            let lblPlot = UILabel()
            lblPlot.frame = CGRect(x: (UIScreen.main.bounds.width/3
                ) + 40, y: 0, width: (UIScreen.main.bounds.width * 0.66666) - 80, height: UIScreen.main.bounds.height/3)
            lblPlot.text = movie!.plot!
            lblPlot.font = UIFont.systemFont(ofSize: 16, weight: .thin)
            lblPlot.numberOfLines = 0
            lblPlot.backgroundColor = UIColor.clear
            lblPlot.textColor = UIColor.white
            cell.backgroundColor = UIColor.black
            cell.addSubview(lblPlot)
        case 3:
            let btAddToWishList = UIButton()
            btAddToWishList.frame = CGRect(x: 10, y: 10, width: (cell.frame.width/2) - 20, height: (cell.frame.height) - 20)
            btAddToWishList.layer.masksToBounds = true
            btAddToWishList.layer.cornerRadius = 5
            btAddToWishList.setTitle("Add to Wish list", for: .normal)
            btAddToWishList.setTitleColor(UIColor.black, for: .normal)
            //btAddToWishList.setImage(UIImage.init(named: "ic_going"), for: UIControlState.normal)
            btAddToWishList.backgroundColor = UIColor.yellow
            btAddToWishList.addTarget(self, action: #selector(self.doAddToTheList(_:)), for: UIControl.Event.touchUpInside)
            cell.addSubview(btAddToWishList)
            
            let btBuyIt = UIButton()
            btBuyIt.frame = CGRect(x: (cell.frame.width/2) + 10, y: 10, width: (cell.frame.width/2) - 20, height: (cell.frame.height) - 20)
            btBuyIt.layer.masksToBounds = true
            btBuyIt.layer.cornerRadius = 5
            //btBuyIt.setImage(UIImage.init(named: "ic_going"), for: UIControlState.normal)
            btBuyIt.setTitle("Buy It on Amazon", for: .normal)
            btBuyIt.backgroundColor = UIColor.red
            btBuyIt.addTarget(self, action: #selector(self.doBuyIt(_:)), for: UIControl.Event.touchUpInside)
            cell.backgroundColor = UIColor.black
            cell.addSubview(btBuyIt)
        default:
            cell.textLabel?.text = "nothing"
        }
        return cell
    }
    
    @objc func doAddToTheList(_ sender: UIButton){
        
    }
    
    @objc func doBuyIt(_ sender: UIButton){
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
