public class AnyNetworkService<ResponceType: Decodable>: NetworkServicing {
    public typealias Responce = ResponceType
    private let fetchMethod: (_ completion: @escaping (Result<[Responce], Error>) -> Void) -> Void

    init<ServiceType: NetworkServicing>(_ service: ServiceType) where ServiceType.Responce == ResponceType {
        fetchMethod = service.fetchData
    }

    public func fetchData(_ completion: @escaping (Result<[Responce], Error>) -> Void) {
        fetchMethod(completion)
    }
}
