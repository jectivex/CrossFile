package CrossFile

import kotlin.test.Test
import kotlin.test.assertTrue

class CrossFileTest {
    @Test fun someCrossFileMethodReturnsTrue() {
        val crossFile = CrossFile()
        assertTrue(crossFile.exists("/dev/null"))
    }
}
