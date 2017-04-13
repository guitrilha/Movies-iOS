//
//  BaseDataSource.swift
//  Movies
//
//  Created by Guilherme Trilha on 05/04/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import UIKit
class BaseDataSource<T> : NSObject, UITableViewDataSource{
    

    var itens = [T]()
    var cellIdentifier : String = ""
    
    public func setItens(itens: [T]){
        self.itens = itens
    }
    
    public func addItem(item: T){
        self.itens.append(item)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath);
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itens.count
        
    }
    
    public func loadContent(){
        
    }
}
