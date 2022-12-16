import UIKit

public protocol DataSourcing {
    associatedtype Data
    var tableRowsNumber: (_ tableView: UITableView, _ section: Int) -> Int { get }
    var tableCell: (_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell { get }
}
