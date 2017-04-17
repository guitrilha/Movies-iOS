//
// Created by Guilherme Trilha on 13/04/17.
// Copyright (c) 2017 Bridge. All rights reserved.
//

import UIKit

class BaseTableViewAdapter<T>: BaseDataSource<T>, UITableViewDelegate {

    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!

    override init(tableView: UITableView){
        super.init(tableView: tableView)
    }

    init(tableView: UITableView, heightConstraint: NSLayoutConstraint) {
        super.init(tableView: tableView)
        self.tableHeightConstraint = heightConstraint
    }

    func hideLastItemSeparator(indexPath: IndexPath, cell: UITableViewCell) {
        if (indexPath.row == self.itens.count - 1) {
            cell.separatorInset = UIEdgeInsetsMake(0, cell.bounds.size.width, 0, 0);
        }
    }

    func resizeTableView() {
        tableHeightConstraint.constant = tableView.contentSize.height
    }

    override func setTableViewHidden(isHidden: Bool) {
        if let heightConstraint = tableHeightConstraint {
            if (isHidden) {
                heightConstraint.constant = 0
            }
        }
        super.setTableViewHidden(isHidden: isHidden)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt
    indexPath: IndexPath){
        let item : T  = getItemAt(position: getItemPositionBy(indexPath: indexPath))
        didSelectedItem(item: item)
    }

    func getItemPositionBy(indexPath: IndexPath) -> Int{
        return indexPath.row
    }

    public func didSelectedItem(item: T){

    }

}