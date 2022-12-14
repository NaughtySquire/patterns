import UIKit
import PlaygroundSupport

// Необходимо переписать экран, чтоб код не нарушал принципы SOLID и использовал паттерны проектирования.
//
// На что обратить внимание:
// - Закрываем зависимости (связи между компонентами) протоколами;
// - Явное инжектирование зависимостей (через init устанавливаем зависимости компонента/объекта);
// - Распределить код по ролям, чтоб разгрузить контроллер;
//
// Дополнительно:
// - Добиться переиспользуемости экрана, используя паттерны проектирования.
// - Должна быть возможность пробросить любой сервис и получить список из другой API;

struct University: Decodable {
    let name: String
}

class ReusableTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let universityService = UniversityService()
    let tableView = UITableView()
    
    var universities: [University] = []
    var onClick: ((University) -> Void)?
        
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.dataSource = self
        tableView.delegate = self
        
        universityService.fetchList { [weak self] result in
            switch result {
            case let .success(universities):
                self?.universities = universities
                self?.tableView.reloadData()
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") ?? UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = universities[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onClick?(universities[indexPath.row])
    }   
}

class UniversityService {
    let jsonDecoder = JSONDecoder()
    
    func fetchList(completion: @escaping (Result<[University], Error>) -> Void) {
        let uri = "http://universities.hipolabs.com/search?country=United+States"
        
        guard let url = URL(string: uri) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard 
                    let data = data,
                    let decodedData = try? self?.jsonDecoder.decode([University].self, from: data)
                else {
                    completion(.failure(URLError(.badServerResponse)))
                    return
                }
                
                completion(.success(decodedData))
            }
        }
        
        dataTask.resume()
    }
}

/// Настраиваем экран и его зависимости 

let viewController = ReusableTableViewController()

viewController.view.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
viewController.onClick = { data in
    print(data)
}

/// Playground

PlaygroundPage.current.liveView = viewController
