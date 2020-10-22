let counter = 0;

async function inc() {
  let tmp = await counter;
  counter = tmp + 1;
}

function main() {
  for (let i = 0; i < 1000; i++) {
    inc();
  }
  console.log('counter:', counter);
}

main();
