use std::sync::Mutex;
use std::thread;

fn main() {
    let counter = Mutex::new(0);
    let mut threads = Vec::new();

    for _ in 0..4 {
        let th = thread::spawn(move || {
            for _ in 0..1000 {
                let mut ctr = counter.lock().unwrap();
                *ctr += 1;
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
