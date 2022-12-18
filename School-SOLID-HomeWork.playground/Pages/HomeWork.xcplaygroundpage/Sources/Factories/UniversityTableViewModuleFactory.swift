import UIKit

public class UniversityTableViewControllerFactory: ViewControllerFactory {
    public init() {}
    public func make() -> UIViewController {
        let tableView = UITableView()
        let universityDataSource = UniversityDataSource()
        let dataSource = AnyDataSource<University>(universityDataSource)
        dataSource.setupDelegate(tableView)
        dataSource.setupDataSource(tableView)
        let networkService = AnyNetworkService(UniversityService())
        let reusableTableView = ReusableTableView(tableView)
        let tableViewController = ReusableTableViewController(reusableTableView,
                                                              dataSource,
                                                              networkService)
        universityDataSource.delegate = tableViewController
        return tableViewController
    }

}
