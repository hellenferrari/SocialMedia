//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL) async -> Result<Data, Error>
}
