import Foundation

public final class UniversityService: NetworkServicing {
    public typealias Responce = University

    let jsonDecoder = JSONDecoder()
    let urlSession = URLSession.shared
    public init() {}

    public func fetchData(_ completion: @escaping (Result<[Responce], Error>) -> Void) {
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
