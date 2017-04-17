//
//  CastAdapter.swift
//  Movies
//
//  Created by Guilherme Trilha on 05/04/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import UIKit
class CastAdapter : BaseTableViewAdapter<Role> {


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CastTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CastTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ReviewTableViewCell.")
        }
        
        let role = itens[indexPath.row]
        cell.setFieldValue(role: role)

        hideLastItemSeparator(indexPath: indexPath, cell: cell)
        resizeTableView()

        return cell
    }
}
