//
//  WeatherViewController.swift
//  AC-iOS-WebURL-Exercises
//
//  Created by Luis Calle on 11/20/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var citiesTableView: UITableView!
    var cities: [City] = []
    let apiClient = CitiesAPIClient(apiKey: "34acb683b184869612aa37954a30b51c")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.citiesTableView.delegate = self
        self.citiesTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.apiClient.fetchCities(completion: { (cities) in
            self.cities = cities
            self.citiesTableView.reloadData()
        }, failure: { error in
            let alertController = UIAlertController(title: "Network Error", message: "Something went wrong. Please try closing and reopening the app to refresh.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            print(error)
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "City Cell", for: indexPath)
        let city = self.cities[indexPath.row]
        cell.textLabel?.text = city.name
        cell.detailTextLabel?.text = "Current temperature: \(city.main.temp) C"
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
