//
//  PopUpMenuViewController.swift
//  Swift Radio
//
//  Created by Matthew Fecher on 7/9/15.
//  Copyright (c) 2015 MatthewFecher.com. All rights reserved.
//

import UIKit
import RealmSwift

class PopUpMenuViewController: UIViewController {

  @IBOutlet weak var trackTableView: UITableView!
  @IBOutlet weak var backgroundView: UIImageView!
  var songs : Results<TrackRealm>?
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .custom
    }
    
    //*****************************************************************
    // MARK: - ViewDidLoad
    //*****************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Round corners
        
        // Set background color to clear
        view.backgroundColor = UIColor.clear
        
        // Add gesture recognizer to dismiss view when touched
//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeButtonPressed))
//        backgroundView.isUserInteractionEnabled = true
//        backgroundView.addGestureRecognizer(gestureRecognizer)
      let realm = try! Realm()
      let realmObjects = realm.objects(TrackRealm.self)
      songs = realmObjects
    }
    
    //*****************************************************************
    // MARK: - IBActions
    //*****************************************************************

//    @IBAction func closeButtonPressed() {
//        dismiss(animated: true, completion: nil)
//    }
//
//    @IBAction func websiteButtonPressed(_ sender: UIButton) {
//        // Use your own website URL here
//        guard let url = URL(string: "https://github.com/analogcode/") else { return }
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//    }
  
}

extension PopUpMenuViewController:UITableViewDelegate{
  
}

extension PopUpMenuViewController:UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let songs = songs else{return 0}
    return songs.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell : UITableViewCell!
    cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    if cell == nil {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    }
    guard let songs = songs else {return UITableViewCell()}
    let song = songs[indexPath.row]
    print(songs)
    cell.textLabel?.text = song.artist
    cell.detailTextLabel?.text = song.title
    return cell
  }
  
  
}
