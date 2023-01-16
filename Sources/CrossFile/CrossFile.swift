import Foundation
#if canImport(Skiff)
import Skiff
import JavaLib
#endif

public class CrossFile {
    public init() {
    }

    /// Returns true if he file at the given path exists.
    public func exists(path: String) throws -> Bool {
        #if canImport(Skiff)
        return try java$io$File(java$lang$String(path)).exists() == true
        #else
        return FileManager.default.fileExists(atPath: path) == true
        #endif
    }
}
