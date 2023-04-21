//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import Foundation

struct URLSessionHTTPClient: HTTPClient {
    func get(from url: URL) async -> Result<Data, Error> {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return .success(data)
        } catch {
            return .failure(error)
        }
    }
}
