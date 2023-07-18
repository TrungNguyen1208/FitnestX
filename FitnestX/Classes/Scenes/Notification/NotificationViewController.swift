//
//  NotificationViewController.swift
//  FitnestX
//
//  Created by Tiến Ngô on 21/06/2023.
//

import UIKit

class NotificationViewController: BaseViewController {
    
    // MARK: - Property
    
    @IBOutlet weak var tableView: UITableView!
    
    // public
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(resource: R.nib.notificationViewCell), forCellReuseIdentifier: R.nib.notificationViewCell.name)
    }
}

// MARK: UITableView

extension NotificationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.notificationViewCell.name) as? NotificationViewCell else {return UITableViewCell()}
        return cell
    }
}
