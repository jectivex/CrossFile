#if canImport(Skiff)
import Skiff
import JavaLib
#else
import Foundation
#endif

public class CrossFile {
    public init() {
    }

    /// Returns true if he file at the given path exists.
    public func exists(path: String) throws -> Bool {
        #if canImport(Skiff)
        return try java$io$File(path.javaString).exists() == true
        #else
        return FileManager.default.fileExists(atPath: path)
        #endif
    }
}
