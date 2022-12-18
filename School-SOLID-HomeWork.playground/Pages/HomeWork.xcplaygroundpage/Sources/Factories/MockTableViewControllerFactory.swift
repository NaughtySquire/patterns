import UIKit

public class MockTableViewControllerFactory: ViewControllerFactory {
    public init() {}
    public func make() -> UIViewController {
        let tableView = UITableView()
        let dataSource = AnyDataSource(MockDataSource())
        dataSource.setupDelegate(tableView)
        dataSource.setupDataSource(tableView)
        let networkService = AnyNetworkService(MockService())
        let reusableTableView = ReusableTableView(tableView)
        let tableViewController = ReusableTableViewController(reusableTableView,
                                                              dataSource,
                                                              networkService)
        return tableViewController
    }

}
