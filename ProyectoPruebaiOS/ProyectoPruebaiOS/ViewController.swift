//
//  ViewController.swift
//  ProyectoPruebaiOS
//
//  Created by Kenneth on 23/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectionButton: UIButton!
    
    var selectedRows: [Int] = Array()
    
    var selectionArray: [String] = ["Cámara", "Foto", "Nombre completo", "Número Telefónico", "Fecha de Nacimiento", "Sexo", "Color Favorito"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }

    func setDelegate() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func selectionCheckBox(_ sender: Any) {
        
        self.performSegue(withIdentifier: "SelectionViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectionViewController" {
            let dataSender = segue.destination as! SelectionViewController
            dataSender.selectionReceivedArray = selectedRows
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nib = UINib(nibName: "CheckBoxTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CheckBoxCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckBoxCell") as! CheckBoxTableViewCell
        
        cell.labelText?.text = selectionArray[indexPath.row]
        cell.selectionStyle = .none
        cell.checkBoxButton.addTarget(self, action: #selector(checkBoxCliked(sender:)), for: .touchUpInside)
        cell.checkBoxButton.tag = indexPath.row
        cell.checkBoxButton.isSelected = false
        
        if selectedRows.contains(indexPath.row) {
            cell.checkBoxButton.isSelected = true
        }
        
        return cell
    }
    
    @objc func checkBoxCliked(sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false

            var indx = 0
            for id in selectedRows {
                if id == sender.tag {
                    selectedRows.remove(at: indx)
                    break
                }
                indx = indx +  1
            }
            selectedRows.sort()
        } else {
            sender.isSelected = true
            selectedRows.append(sender.tag)
            selectedRows.sort()
        }
        
    }
    
}
