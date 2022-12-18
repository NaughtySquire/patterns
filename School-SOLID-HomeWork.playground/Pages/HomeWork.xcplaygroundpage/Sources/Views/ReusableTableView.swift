import UIKit

public protocol DisplaysReusableTableView: UIView {
    func reloadTable()
}

public final class ReusableTableView: UIView {
    // MARK: - views
    public let tableView: UITableView

    // MARK: - init
    public init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init(frame: .zero)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - functions
    private func setupViews() {
        [tableView].forEach {
            self.addSubview($0)
        }
    }
    private func setupConstraints() {
        [tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - DisplaysReusableTableView extension
extension ReusableTableView: DisplaysReusableTableView {
    public func reloadTable(){
        tableView.reloadData()
    }
}
