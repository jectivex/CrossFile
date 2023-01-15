package CrossFile

class CrossFile {
    fun exists(path: String): Boolean {
        return java.io.File(path).exists() == true
    }
}
