import UIKit

public final class ReusableTableViewController<DataSourceType: DataSourcing>: UIViewController {
    let universityService = UniversityService()
    var contentView: DisplaysReusableTableView
    let dataSource: DataSourceType

    public override func loadView() {
        view = contentView
    }

    public init(_ contentView: DisplaysReusableTableView, _ dataSource: DataSourceType) {
        self.contentView = contentView
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
//        contentView.configure(tableViewDelegate: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


//    var universities: [University] = []
    var onClick: ((University) -> Void)? = { data in
        print(data)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        //
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")


//        universityService.fetchList { [weak self] result in
//            switch result {
//            case let .success(universities):
//                self?.universities = universities
//                //                self?.tableView.reloadData()
//            case let .failure(error):
//                print(error.localizedDescription)
//            }
//        }
    }
}
