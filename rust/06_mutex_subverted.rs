use std::sync::{Arc, Mutex};
use std::thread;

fn main() {
    let counter = Arc::new(Mutex::new(0));
    let mut threads = Vec::new();

    for _ in 0..4 {
        let ctr_ref = counter.clone();

        let th = thread::spawn(move || {
            for _ in 0..1000 {
                let tmp = *ctr_ref.lock().unwrap();
                *ctr_ref.lock().unwrap() = tmp + 1;
            }
        });
        threads.push(th);
    }

    for th in threads {
        th.join().unwrap();
    }

    let ctr = counter.lock().unwrap();
    println!("counter: {}", *ctr);
}
