import Foundation
import UIKit

public class UniversityTableViewControllerFactory {
    public init() {}
//    public func make() -> ReusableTableViewController<AnyDataSource<University>, AnyNetworkService<University>> {
//        let  tableView = UITableView()
//        let dataSource = AnyDataSource(UniversityDataSource())
//        dataSource.setupDelegate(tableView)
//        dataSource.setupDataSource(tableView)
//        let networkService = AnyNetworkService(UniversityService())
//        let reusableTableView = ReusableTableView(tableView)
//        let tableViewController = ReusableTableViewController(reusableTableView,
//                                                              dataSource,
//                                                              networkService)
//
//        return tableViewController
//    }
    public func make() -> UIViewController {
        let  tableView = UITableView()
        let dataSource = AnyDataSource(UniversityDataSource())
        dataSource.setupDelegate(tableView)
        dataSource.setupDataSource(tableView)
        let networkService = AnyNetworkService(UniversityService())
        let reusableTableView = ReusableTableView(tableView)
        let tableViewController = ReusableTableViewController(reusableTableView,
                                                              dataSource,
                                                              networkService)

        return tableViewController
    }

}
