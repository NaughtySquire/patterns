import Foundation

public final class MockService: NetworkServicing {
    public init() {}

    public func fetchData(_ completion: @escaping (Result<[MockModel], Error>) -> Void) {
        DispatchQueue.global().async {
            sleep(1)
            DispatchQueue.main.async {
                let mockData = [MockModel(data: "test")]
                completion(.success(mockData))
            }
        }
    }
}
