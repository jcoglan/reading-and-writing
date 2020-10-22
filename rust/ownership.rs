#![allow(dead_code)]
#![allow(unused_variables)]

fn main() {
    let mut list = vec![1, 2, 3];
    let list_mut = &mut list[1];
    *list_mut = 4;
    show(&list);
}

fn show(list: &Vec<i32>) {
    println!("list: {:?}", list);
}

fn add<T>(list: &mut Vec<T>, item: T) {
    list.push(item);
}

fn do_nothing(list: Vec<i32>) {}
