import Foundation
import UIKit

public class UniversityTableViewModuleFactory {
    public init() {}
    public func make() -> ReusableTableViewController<AnyDataSource<University>> {
        let  tableView = UITableView()
        let dataSource = AnyDataSource(UniversityDataSource())
        dataSource.setupDelegate(tableView)
        dataSource.setupDataSource(tableView)
        let reusableTableView = ReusableTableView(tableView)
        let tableViewController = ReusableTableViewController<AnyDataSource>(reusableTableView, dataSource)
        return tableViewController
    }
}
