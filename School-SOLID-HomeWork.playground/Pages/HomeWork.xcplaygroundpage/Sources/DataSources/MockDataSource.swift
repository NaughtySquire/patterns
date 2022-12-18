import Foundation
import UIKit

public protocol MockDataSourceDelegate: AnyObject {
    func tableViewDidSelectRowAt(data: University) -> Void
}

public final class MockDataSource: DataSourcing {
    // MARK: - internal properties
    public var data: [MockModel]?

    // MARK: - callbacks
    public var tableViewNumberOfRowsInSection: ((UITableView, Int) -> Int) {
        { [weak self] tableView, section in
            guard let self = self else { return 0 }
            return self.data?.count ?? 0
        }
    }

    public var tableViewCellForRowAt: (UITableView, IndexPath) -> UITableViewCell {
        { [weak self] tableView ,indexPath in
            guard let self = self else { return UITableViewCell() }
            let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier) ?? UITableViewCell(style: .default, reuseIdentifier: UITableViewCell.identifier)

            cell.textLabel?.text = self.data?[indexPath.row].data ?? ""
            return cell
        }
    }

//    public var tableViewDidSelectRowAt: (_ tableView: UITableView, _ indexPath: IndexPath) -> Void {
//        { [weak self] _, indexPath in
//            guard let self = self,
//                  let data = self.data?[indexPath.row] else {
//                return
//            }
//            self.delegate?.tableViewDidSelectRowAt(data: data)
//        }
//    }

    // MARK: - init
    public init() {}

    // MARK: - functions
    public func setupData(_ data: [MockModel]?) {
        self.data = data
    }
}
