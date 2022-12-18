public class AnyNetworkService<ResponceType: Decodable>: NetworkServicing {

    // MARK: - callbacks
    private let fetchMethod: (_ completion: @escaping (Result<[ResponceType], Error>) -> Void) -> Void

    // MARK: - init
    init<ServiceType: NetworkServicing>(_ service: ServiceType) where ServiceType.Responce == ResponceType {
        fetchMethod = service.fetchData
    }
    // MARK: - functions
    public func fetchData(_ completion: @escaping (Result<[ResponceType], Error>) -> Void) {
        fetchMethod(completion)
    }
}
