import UIKit

public protocol DataSourcing {
    associatedtype DataType
    var data: DataType? { get set }
    var tableRowsNumber: (_ tableView: UITableView, _ section: Int) -> Int { get }
    var tableCell: (_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell { get }
    func setupData(_ data: DataType?)
}
