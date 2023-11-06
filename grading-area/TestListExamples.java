import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }
  @Test 
	public void testMerge() {
        List<String> input1 = Arrays.asList("b", "c", "d");
        List<String> input2 = Arrays.asList("a", "d", "e", "e", "e");
        List<String> input3 = Arrays.asList("a", "b", "c", "d", "e", "e", "e");

        assertEquals(input3, ListExamples.merge(input1, input2));
	}
}
