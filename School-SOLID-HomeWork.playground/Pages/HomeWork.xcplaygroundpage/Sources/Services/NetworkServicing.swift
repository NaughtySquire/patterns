public protocol NetworkServicing {
    associatedtype Responce
    func fetchData(_ completion: @escaping (Result<[Responce], Error>) -> Void)
}
