//
//  ViewController.swift
//  DemoTableView
//
//  Created by Issarapong Poesua on 8/7/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController
{
    
    @IBOutlet weak var tableView: UITableView!
    
    private let arrayOfPersons: [Person] = [Person(name: "A", age: 20),
                                            Person(name: "B", age: 40)]
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        prepareTableViewDataSource()
    }
    
    func prepareTableViewDataSource()
    {
        let observableArray = Observable.just(arrayOfPersons)
        
        observableArray.bind(to: tableView.rx.items(cellIdentifier: "cell",
                                                    cellType: UITableViewCell.self)){
                                                        (row, person, cell) in
                                                cell.textLabel?.text = person.name
                                                cell.detailTextLabel?.text = "\(person.age)"

            }.addDisposableTo(disposeBag)
    }
}


struct Person {
    var name: String
    var age: Int
}
