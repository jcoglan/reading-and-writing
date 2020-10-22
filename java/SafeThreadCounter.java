import java.util.*;

class Counter {
    private int value = 0;

    synchronized void inc() {
        value += 1;
    }

    int get() {
        return value;
    }
}

public class SafeThreadCounter {
    public static void main(String[] args) {
        Counter ctr = new Counter();
        List<Thread> threads = new ArrayList<Thread>();

        for (int t = 0; t < 4; t++) {
            Thread th = new Thread(() -> {
                for (int i = 0; i < 1000; i++) {
                    ctr.inc();
                }
            });
            th.start();
            threads.add(th);
        }

        for (Thread th: threads) {
            try {
                th.join();
            } catch (InterruptedException e) {
                // ignore
            }
        }

        System.out.println("counter: " + ctr.get());
    }
}
