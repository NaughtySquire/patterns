import Foundation

public final class UniversityService: NetworkServicing {
    // MARK: - internal properties
    private let jsonDecoder = JSONDecoder()
    private let urlSession = URLSession.shared

    // MARK: - init
    public init() {}

    // MARK: - functions
    public func fetchData(_ completion: @escaping (Result<[University], Error>) -> Void) {
        let uri = "http://universities.hipolabs.com/search?country=United+States"

        guard let url = URL(string: uri) else {
            completion(.failure(URLError(.badURL)))
            return
        }

        let dataTask = urlSession.dataTask(with: url) { [weak self] data, response, error in
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
