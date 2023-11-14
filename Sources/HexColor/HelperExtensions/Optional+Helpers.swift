// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension Optional {
    func `default`(_ value: Wrapped) -> Wrapped { self ?? value }
}
