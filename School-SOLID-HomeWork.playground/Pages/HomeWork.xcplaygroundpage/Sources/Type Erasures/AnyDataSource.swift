import Foundation
import UIKit

public final class AnyDataSource<DataType>:NSObject,
                                    DataSourcing,
                                    UITableViewDataSource,
                                    UITableViewDelegate {
    // MARK: - internal properties
    public var data: [DataType]?

    // MARK: - callbacks
    public var tableViewNumberOfRowsInSection: (_ tableView: UITableView, _ section: Int) -> Int
    public var tableViewCellForRowAt: (_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell
    public var tableViewDidSelectRowAt: (_ tableView: UITableView, _ indexPath: IndexPath) -> Void
    private var setupDataMethod: (_ data: [DataType]?) -> Void

    // MARK: - init
    public init<DataSourceType: DataSourcing>(_ dataSource: DataSourceType) where DataSourceType.DataType == DataType {
        tableViewNumberOfRowsInSection = dataSource.tableViewNumberOfRowsInSection
        tableViewCellForRowAt = dataSource.tableViewCellForRowAt
        setupDataMethod = dataSource.setupData
        tableViewDidSelectRowAt = dataSource.tableViewDidSelectRowAt
    }
    // MARK: - functions
    public func setupDataSource(_ tableView: UITableView) {
        tableView.dataSource = self

    }
    public func setupDelegate(_ tableView: UITableView) {
        tableView.delegate = self
    }

    public func setupData(_ data: [DataType]?) {
        setupDataMethod(data)
    }
    // MARK: - Table DataSource methods
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewNumberOfRowsInSection(tableView, section)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableViewCellForRowAt(tableView, indexPath)
    }

    // MARK: - Table Delegate methods
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Void {
        tableViewDidSelectRowAt(tableView, indexPath)
    }

}
