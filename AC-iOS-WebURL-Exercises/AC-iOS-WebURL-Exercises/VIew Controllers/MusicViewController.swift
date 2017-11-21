//
//  MusicViewController.swift
//  AC-iOS-WebURL-Exercises
//
//  Created by Luis Calle on 11/20/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var musicTableView: UITableView!
    var songs: [Song] = []
    let apiClient = MusicAPIClient(query: "Justin")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.musicTableView.delegate = self
        self.musicTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.apiClient.fetchSongs(completion: { (songs) in
            self.songs = songs
            self.musicTableView.reloadData()
        }, failure: { error in
            let alertController = UIAlertController(title: "Network Error", message: "Something went wrong. Please try closing and reopening the app to refresh.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            print(error)
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        let song = self.songs[indexPath.row]
        cell.textLabel?.text = song.song_name
        cell.detailTextLabel?.text = song.display_artist
        return cell
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
