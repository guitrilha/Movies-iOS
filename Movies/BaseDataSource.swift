//
//  BaseDataSource.swift
//  Movies
//
//  Created by Guilherme Trilha on 05/04/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import UIKit
class BaseDataSource<T> : NSObject, UITableViewDataSource{

    var tableView : UITableView!

    var itens = [T]() {
        didSet {
            setTableViewHidden(isHidden : self.itens.count == 0)
        }
    }
    var cellIdentifier : String = ""

    init(tableView : UITableView){
        super.init()
        self.tableView = tableView
        configTableView()
    }

    private func configTableView(){
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    public func setItens(itens: [T]){
        self.itens = itens
        tableView.reloadData()
    }
    
    public func addItem(item: T){
        self.itens.append(item)
        tableView.reloadData()
    }

    public func getItemAt(position: Int) -> T{
        return itens[position]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath);
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itens.count
    }

    func setTableViewHidden(isHidden : Bool){
        tableView.isHidden = isHidden
    }
}
