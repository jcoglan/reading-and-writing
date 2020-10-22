class SortedMap {
  #map
  #keys

  constructor() {
    this.#map  = new Map();
    this.#keys = [];
  }

  set(key, value) {
    this.#map.set(key, value);

    if (!this.#keys.includes(key)) {
      this.#keys.push(key);
      this.#keys = this.#keys.sort();
    }
  }

  all() {
    return this.#keys.map((key) => {
      let value = this.#map.get(key);
      return [key, value];
    });
  }
}

function main() {
  let map = new SortedMap();

  map.set('london',     9.75e6);
  map.set('birmingham', 2.45e6);
  map.set('manchester', 1.90e6);

  for (let [key, value] of map.all()) {
    console.log(key, value);
  }
}

main();
