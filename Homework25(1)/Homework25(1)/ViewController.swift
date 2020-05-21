//
//  ViewController.swift
//  Homework25(1)
//
//  Created by Kato on 5/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var countries = [Country]()
    var filteredCountries = [Country]()
    var filterSet = false
    
    let apiService = APIService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        apiService.fetchCountries { (countries) in
            
            for country in countries {
                print(country.name)
                self.countries.append(country)
            }
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        
    }
    
    func filterCountries(searchText: String) {
        if self.filterSet {
            self.filteredCountries.removeAll()
            for i in self.countries {
                if i.name.contains(searchText) || i.capital.contains(searchText) {
                    self.filteredCountries.append(i)
                }
            }
        }
        self.tableView.reloadData()
    }
    
 

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var cellCount = 0
        if self.filterSet
        {
            cellCount = self.filteredCountries.count
        }
        else
        {
            cellCount = self.countries.count
        }
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "info_cell", for: indexPath) as! InfoCell
        if self.filterSet {
            cell.countryLabel.text = "Country: \(filteredCountries[indexPath.row].name)"
                cell.capitalLabel.text = "Captial: \(filteredCountries[indexPath.row].capital)"
                
                let currency = filteredCountries[indexPath.row].currencies
                
                cell.currenciesLabel.text = "Currency: \(currency[0].symbol ?? "")"
                cell.bordersLabel.text = "Borders: " + filteredCountries[indexPath.row].borders.joined(separator: ", ")

        }
        else
        {
            cell.countryLabel.text = "Country: \(countries[indexPath.row].name)"
            cell.capitalLabel.text = "Captial: \(countries[indexPath.row].capital)"
            
            let currency = countries[indexPath.row].currencies
            
            cell.currenciesLabel.text = "Currency: \(currency[0].symbol ?? "")"
            cell.bordersLabel.text = "Borders: " + countries[indexPath.row].borders.joined(separator: ", ")
        
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let temp = storyboard.instantiateViewController(withIdentifier: "details_vc")
        
        if let vc = temp as? DetailsViewController {
            
            let country = countries[indexPath.row]
            
            vc.countryName = country.name
            vc.capitalName = country.capital
            vc.nativeName = country.nativeName
            vc.region = country.region
            vc.population = country.population
            
            //vc.flag = country.flag
            
            /* countries[indexPath.row].flag.downloadImage { (image) in
                DispatchQueue.main.async {
                    vc.flagImage.image = image
                }
            }
            */
        }
        
        self.navigationController?.pushViewController(temp, animated: true)
    }
    
    
}

extension String {
    
    func downloadImage(completion: @escaping (UIImage?) -> ()) {

        guard let url = URL(string: self) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 3 {
            filterSet = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.filterCountries(searchText: searchText)
            }
        }
        else
        {
            filterSet = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.filterCountries(searchText: searchText)
            }
        }
                
    }
 
}

