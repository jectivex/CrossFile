package CrossFile

open class CrossFile {
    constructor() {
    }

    open fun exists(path: String): Boolean {
        return java.io.File((path)).exists() == true
    }
}
