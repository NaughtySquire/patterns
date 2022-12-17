import UIKit

public final class ReusableTableViewController<DataSourceType: DataSourcing, ServiceType: NetworkServicing>: UIViewController {

    let service: ServiceType
    var dataSource: DataSourceType
    var contentView: DisplaysReusableTableView
    var onClick: ((University) -> Void)? = { data in
        print(data)
    }

    public override func loadView() {
        view = contentView
    }

    public init(_ contentView: DisplaysReusableTableView, _ dataSource: DataSourceType, _ service: ServiceType) {
        self.contentView = contentView
        self.dataSource = dataSource
        self.service = service
        super.init(nibName: nil, bundle: nil)
        fetchData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fetchData() {
        service.fetchData { [weak self] result in
            switch result {
            case let .success(universities):
                self?.dataSource.setupData(universities as? DataSourceType.DataType)
                self?.contentView.reloadTable()
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
