let counter = Promise.resolve(0);

function inc() {
  counter = counter.then((value) => value + 1);
}

async function main() {
  for (let i = 0; i < 1000; i++) {
    inc();
  }
  let value = await counter;
  console.log('counter:', value);
}

main();
