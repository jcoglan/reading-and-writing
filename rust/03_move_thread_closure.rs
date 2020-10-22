use std::thread;

fn main() {
    let mut counter = 0;
    let mut threads = Vec::new();

    for _ in 0..4 {
        let th = thread::spawn(move || {
            for _ in 0..1000 {
                counter += 1;
            }
        });
        threads.push(th);
    }

    for th in threads {
        th.join().unwrap();
    }

    println!("counter: {}", counter);
}
