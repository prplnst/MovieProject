//
//  ViewController.swift
//  MovieProject
//
//  Created by prplnst on 11/20/20.
//

import UIKit
import Alamofire

typealias Parameters  = [String : Any]

class ViewController: UIViewController {

    var tableView = UITableView()
    var parameters : Parameters = ["api_key" : "793bdd13b6cdcbd09909d2761e13de08", "page" : 1]
    var shouldKeepPagination = true
    var refresh = UIRefreshControl()
    var tableViewData : [MovieModel] = [] {
        didSet{
            tableView.reloadData()
            shouldKeepPagination = true
        }
    }
    
    var currentPage = 1 {
        didSet {
            parameters["page"] = currentPage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getMovies()
        setupView()
        
    let backgroundView = UIView()
    backgroundView.backgroundColor = #colorLiteral(red: 0.1963050067, green: 0.2067680359, blue: 0.3837721944, alpha: 1)
        
        
        
     // Navigation Bar
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1963050067, green: 0.2067680359, blue: 0.3837721944, alpha: 1)
        self.title = "Movies"
        let atributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont(name: "Copperplate", size: 30)
        ]
        navigationController?.navigationBar.titleTextAttributes = atributes as [NSAttributedString.Key : Any]
        
     // Refresh
        refresh.tintColor = .white
        tableView.addSubview(refresh)
        self.refresh.addTarget(self, action: #selector(doRefresh), for: .valueChanged)
        getMovies()
    }
    
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainCell.self, forCellReuseIdentifier: "MainCell")
      
    }
    
    func setupView(){
         view.addSubview(tableView)
         tableView.snp.makeConstraints {
            (make) in
             make.top.equalTo(90)
             make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    func getMovies(){
        AF.request("https://api.themoviedb.org/3/movie/popular?", method: .get, parameters: parameters, headers: nil, interceptor: nil, requestModifier: nil).responseData { (data) in
            switch data.result {
            case .success(let data):
                do {
                    let array = try JSONDecoder().decode(Response.self, from: data)
                    self.tableViewData.append(contentsOf: array.results)
                } catch  {
                    print(error)
                }

            case .failure(let error):
                print(error)
            }
        }
    }
    
   
    
    @objc func doRefresh(){
       currentPage = 1
       getMovies()
       tableView.reloadData()
       refresh.endRefreshing()
   }
    
    

}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell",for: indexPath) as! MainCell
            cell.setupCell(with: tableViewData[indexPath.row])
            let backgroundColorView = UIView()
        backgroundColorView.backgroundColor = #colorLiteral(red: 0.1963050067, green: 0.2067680359, blue: 0.3837721944, alpha: 1)
        cell.selectedBackgroundView = backgroundColorView
        
        cell.backgroundColor = #colorLiteral(red: 0.1963050067, green: 0.2067680359, blue: 0.3837721944, alpha: 1)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailViewController(movie: tableViewData[indexPath.row]), animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == tableViewData.count - 1 && shouldKeepPagination{
            shouldKeepPagination = false
            currentPage += 1
            getMovies()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
}
