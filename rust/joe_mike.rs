struct Joe;

impl Joe {
    fn hello(&mut self, mike: &Mike) {
        println!("starting Joe.hello");
        mike.hello(self);
        println!("finishing Joe.hello");
    }

    fn interrupt(&mut self) {
        println!("INTERRUPTING JOE");
    }
}

struct Mike;

impl Mike {
    fn hello(&self, joe: &Joe) {
        joe.interrupt();
    }
}

fn main() {
    let mut joe = Joe;
    let mike = Mike;

    joe.hello(&mike);
}
