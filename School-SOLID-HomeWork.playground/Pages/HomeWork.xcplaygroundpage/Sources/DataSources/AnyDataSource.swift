import Foundation
import UIKit

public final class AnyDataSource<DataType>:NSObject,
                                    DataSourcing,
                                    UITableViewDataSource,
                                           UITableViewDelegate {
    public var data: DataType?
    public var tableRowsNumber: (_ tableView: UITableView, _ section: Int) -> Int
    public var tableCell: (_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell
    private var setupDataMethod: (_ data: DataType?) -> Void

    public init<DataSourceType: DataSourcing>(_ dataSource: DataSourceType) where DataSourceType.DataType == DataType {
        tableRowsNumber = dataSource.tableRowsNumber
        tableCell = dataSource.tableCell
        setupDataMethod = dataSource.setupData
    }

    public func setupDataSource(_ tableView: UITableView) {
        tableView.dataSource = self

    }
    public func setupDelegate(_ tableView: UITableView) {
        tableView.delegate = self
    }

    public func setupData(_ data: DataType?) {
        setupDataMethod(data)
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableRowsNumber(tableView, section)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableCell(tableView, indexPath)
    }
}
