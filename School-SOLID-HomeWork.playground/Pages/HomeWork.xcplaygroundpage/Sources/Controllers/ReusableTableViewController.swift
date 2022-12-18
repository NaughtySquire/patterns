import UIKit

public final class ReusableTableViewController<DataSourceType: DataSourcing, ServiceType: NetworkServicing>: UIViewController {
    // MARK: - internal properties
    private let service: ServiceType
    private let dataSource: DataSourceType
    private let contentView: DisplaysReusableTableView
    private let onClick: ((University) -> Void)? = { data in
        print(data)
    }
    // MARK: - life cycle
    public override func loadView() {
        view = contentView
    }
    // MARK: - init
    public init(_ contentView: DisplaysReusableTableView, _ dataSource: DataSourceType, _ service: ServiceType) where DataSourceType.DataType == ServiceType.Responce  {
        self.contentView = contentView
        self.dataSource = dataSource
        self.service = service
        super.init(nibName: nil, bundle: nil)
        fetchData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - functions
    private func fetchData() {
        service.fetchData { [weak self] result in
            switch result {
            case let .success(universities):
                self?.dataSource.setupData(universities as? [DataSourceType.DataType])
                self?.contentView.reloadTable()
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
// MARK: - UniversityDataSourceDelegate extension
extension ReusableTableViewController: UniversityDataSourceDelegate {
    public func tableViewDidSelectRowAt(data: University) {
        onClick?(data)
    }
}
