class Counter {
    private int value = 0;

    void inc() {
        value += 1;
    }

    int get() {
        return value;
    }
}

public class SyncCounter {
    public static void main(String[] args) {
        Counter ctr = new Counter();

        for (int i = 0; i < 1000; i++) {
            ctr.inc();
        }

        System.out.println("counter: " + ctr.get());
    }
}
