let counter = 0;

function inc() {
  let tmp = counter;
  counter = tmp + 1;
  anotherFunction();
}

function anotherFunction() {
  --counter;
}

function main() {
  for (let i = 0; i < 1000; i++) {
    inc();
  }
  console.log('counter:', counter);
}

main();
