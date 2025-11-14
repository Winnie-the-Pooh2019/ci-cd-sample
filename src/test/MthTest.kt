import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.assertEquals
import utils.Mth

class MthTest {

    @Test
    fun pow() {
        assertEquals(125.0, Mth.pow(5.0, 3))
    }
}