let joe = {
  hello() {
    console.log('starting joe.hello');
    mike.hello();
    console.log('finishing joe.hello');
  },

  interrupt() {
    console.log('INTERRUPTING JOE');
  }
};

let mike = {
  hello() {
    joe.interrupt();
  }
};

joe.hello();
