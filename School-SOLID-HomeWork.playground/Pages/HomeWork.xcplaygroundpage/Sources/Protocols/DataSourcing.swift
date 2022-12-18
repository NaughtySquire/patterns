import UIKit

public protocol DataSourcing {
    associatedtype DataType
    var data: [DataType]? { get }
    var tableViewNumberOfRowsInSection: (_ tableView: UITableView, _ section: Int) -> Int { get }
    var tableViewCellForRowAt: (_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell { get }
    var tableViewDidSelectRowAt: (_ tableView: UITableView, _ indexPath: IndexPath) -> Void { get }
    func setupData(_ data: [DataType]?)
}
extension DataSourcing {
    /// Дефолтная реализация DidSelectRowAt
    public var tableViewDidSelectRowAt: (_ tableView: UITableView, _ indexPath: IndexPath) -> Void {
        { tableView, indexPath in
            return
        }
    }
}
