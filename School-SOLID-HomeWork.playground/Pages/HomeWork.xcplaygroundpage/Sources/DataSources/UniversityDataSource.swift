import Foundation
import UIKit

public final class UniversityDataSource: DataSourcing {

    public var data: [University]?

    public lazy var tableRowsNumber: ((UITableView, Int) -> Int) = { [weak self] tableView, section in
        guard let self = self else { return 0 }
        return self.data?.count ?? 0
    }

    public lazy var tableCell: (UITableView, IndexPath) -> UITableViewCell = { [weak self] tableView ,indexPath in
        guard let self = self else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") ?? UITableViewCell(style: .default, reuseIdentifier: "cellId")

        cell.textLabel?.text = self.data?[indexPath.row].name ?? ""
        return cell

    }

    public init() {}


    public func setupData(_ data: [University]?) {
        self.data = data
    }



    
    
}
