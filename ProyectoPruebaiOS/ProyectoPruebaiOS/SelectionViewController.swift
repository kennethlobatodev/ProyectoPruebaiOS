//
//  SelectionViewController.swift
//  ProyectoPruebaiOS
//
//  Created by Kenneth on 26/04/21.
//

import UIKit

class SelectionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectionReceivedArray: [Int] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(selectionReceivedArray)
        
        setDelegate()
        setView()
    }
    
    func setDelegate() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setView() {
        let nibCameraTableViewCell = UINib(nibName: "CameraTableViewCell", bundle: nil)
        tableView.register(nibCameraTableViewCell, forCellReuseIdentifier: "CameraTableViewCell")
        
        let nibPhotoTableViewCell = UINib(nibName: "PhotoTableViewCell", bundle: nil)
        tableView.register(nibPhotoTableViewCell, forCellReuseIdentifier: "PhotoTableViewCell")
        
        let nibTextTableViewCell = UINib(nibName: "TextTableViewCell", bundle: nil)
        tableView.register(nibTextTableViewCell, forCellReuseIdentifier: "TextTableViewCell")
        
        let nibPhoneTableViewCell = UINib(nibName: "PhoneTableViewCell", bundle: nil)
        tableView.register(nibPhoneTableViewCell, forCellReuseIdentifier: "PhoneTableViewCell")
        
        let nibDateOfBirthTableViewCell = UINib(nibName: "DateOfBirthTableViewCell", bundle: nil)
        tableView.register(nibDateOfBirthTableViewCell, forCellReuseIdentifier: "DateOfBirthTableViewCell")
        
        let nibGenderTableViewCell = UINib(nibName: "GenderTableViewCell", bundle: nil)
        tableView.register(nibGenderTableViewCell, forCellReuseIdentifier: "GenderTableViewCell")
        
        let nibColorTableViewCell = UINib(nibName: "ColorTableViewCell", bundle: nil)
        tableView.register(nibColorTableViewCell, forCellReuseIdentifier: "ColorTableViewCell")
    }
    

}

extension SelectionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectionReceivedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CameraTableViewCell") as! CameraTableViewCell
        return cell
    }
    
    
}
