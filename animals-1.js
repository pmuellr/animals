#!/usr/bin/env node

//------------------------------------------------------------------------------

function feedAnimals(animals) {
  var i, animal, grass, water, meat;

  for (i = 0; i < animals.length; i++) {
    animal = animals[i];
    if (animal.isHerbivore()) {
      grass = core.prepareGrass(animal);
      water = core.prepareWater(animal);
      animal.feed([grass, water]);
    } else if (animal.isCarnivore()) {
      meat = core.prepareMeat(animal);
      water = core.prepareWater(animal);
      animal.feed([meat, water]);
    }
  }
}

//------------------------------------------------------------------------------

require('coffee-script')

var core = require('./animals-core')

core.run(function(animals) {
    feedAnimals(animals.slice(0,2))
})
