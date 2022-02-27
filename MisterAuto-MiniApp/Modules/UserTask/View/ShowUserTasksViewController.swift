//
//  ShowUserTasksViewController.swift
//  MisterAuto-MiniApp
//
//  Created by Brahim ELMSSILHA on 2/27/22.
//

import UIKit

class ShowUserTasksViewController: UIViewController, AnyView {
    
    private var tableView: UITableView!
    private var refreshControl: UIRefreshControl!
    
    var presenter: AnyPresenter?
    var _presenter: ShowUserTasksViewControllerPresenter? {
        self.presenter as? ShowUserTasksViewControllerPresenter
    }
    
    var selectedUser: ShowUser!
    var data: [ShowUserTask] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        tableView = .init()
        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        refreshControl = .init()
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        self.view.addSubview(tableView)
             
        _presenter?.didLoadView(userId: self.selectedUser.id)
    }

    
    @objc func loadData() {
        
        self.data = []
        _presenter?.didLoadView(userId: self.selectedUser.id)

    }
    
    // MARK: - Presenter
    
    func ShowUserTasks(_ users: [ShowUserTask]) {
        
        self.data = users
        self.tableView.reloadData()
        
        self.refreshControl.endRefreshing()
    }

}

extension ShowUserTasksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = data[indexPath.row]
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = """
            \(item.title)
            """
        
        cell.textLabel?.textColor = .white
        
        return cell
    }
    

}
