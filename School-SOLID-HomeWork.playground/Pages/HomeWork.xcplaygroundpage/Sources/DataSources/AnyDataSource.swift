import Foundation
import UIKit

public final class AnyDataSource<DataType>:NSObject,
                                    DataSourcing,
                                    UITableViewDataSource,
                                    UITableViewDelegate {

    public typealias Data = DataType
    public var tableRowsNumber: (_ tableView: UITableView, _ section: Int) -> Int
    public var tableCell: (_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell

    public init<DataSourceType: DataSourcing>(_ dataSource: DataSourceType) where DataSourceType.Data == DataType {
        tableRowsNumber = dataSource.tableRowsNumber
        tableCell = dataSource.tableCell
    }

    public func setupDataSource(_ tableView: UITableView) {
        tableView.dataSource = self

    }
    public func setupDelegate(_ tableView: UITableView) {
        tableView.delegate = self
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableRowsNumber(tableView, section)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableCell(tableView, indexPath)
    }
}
