import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
    private let networkProvider: NetworkProvider

    public init() {
        networkProvider = NetworkProvider()
    }

    public func makeAllPostsUseCase() -> Domain.AllPostsUseCase {
        return AllPostsUseCase(network: networkProvider.makePostsNetwork(),
                               cache: Cache<Post>(path: "allPosts"))
    }

    public func makeCreatePostUseCase() -> Domain.SavePostUseCase {
        return SavePostUseCase(network: networkProvider.makePostsNetwork())
    }
}
