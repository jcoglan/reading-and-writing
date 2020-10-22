fn main() {
    let mut counter = 0;
    let mut mut_refs = Vec::new();

    for _ in 0..4 {
        mut_refs.push(&mut counter);
    }
}
