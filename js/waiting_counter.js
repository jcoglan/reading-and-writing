let counter = 0;

async function inc() {
  let tmp = await counter;
  counter = tmp + 1;
}

async function main() {
  let tasks = [];

  for (let i = 0; i < 1000; i++) {
    tasks.push(inc());
  }
  await Promise.all(tasks);
  console.log('counter:', counter);
}

main();
