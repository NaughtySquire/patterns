import Foundation
import UIKit

public final class UniversityDataSource: DataSourcing {
    public typealias Data = University
    private var universities: [Data]?

    public var tableRowsNumber: ((UITableView, Int) -> Int) = { tableView, section in
        //        return universities.count
        100
    }

    public var tableCell: (UITableView, IndexPath) -> UITableViewCell = { tableView ,indexPath in
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") ?? UITableViewCell(style: .default, reuseIdentifier: "cellId")

        //        cell.textLabel?.text = universities[indexPath.row].name
        UITableViewCell()

    }

    public init() {}
    
    
}
