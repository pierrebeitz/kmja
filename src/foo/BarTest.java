package foo;

import de.kopeme.Checker;
import de.kopeme.PerformanceTest;
import de.kopeme.datacollection.DataCollectorList;
import de.kopeme.datacollection.TestResult;

public class BarTest {

	 @PerformanceTest(executionTimes = 5, warmupExecutions = 2)
	 public void testTest(final TestResult tr) throws InterruptedException {
		 tr.setCollectors(DataCollectorList.STANDARD);

		 tr.startCollection();
		 Thread.sleep((long)(Math.random() * 5000));
		 tr.stopCollection();
		 tr.setChecker(new Checker() {
			 @Override
			 public void checkValues(TestResult tr) {
				 
			 }
		 });
	 }

}
