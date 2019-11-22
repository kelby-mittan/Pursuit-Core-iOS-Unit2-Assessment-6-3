//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class CrayonListViewController: UIViewController {
    
    @IBOutlet weak var crayonTableView: UITableView!
    
    
    private var crayons = [Crayon]() {
        didSet {
            crayonTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        crayonTableView.dataSource = self
        loadData()
        
    }
    
    func loadData() {
        crayons = Crayon.allTheCrayons
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let colorVC = segue.destination as? ColorViewController, let indexPath = crayonTableView.indexPathForSelectedRow else {
            fatalError()
        }
        
        colorVC.color = crayons[indexPath.row]
    }

}

extension CrayonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = crayonTableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        let crayon = crayons[indexPath.row]
        
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        return cell
    }
}
    


