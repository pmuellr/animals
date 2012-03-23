#!/usr/bin/env node

//------------------------------------------------------------------------------

function feedAnimals(animals) {
  var i, animal, grass, water, meat;

  for (i = 0; i < animals.length; i++) {
    animal = animals[i];
    if (animal.isHerbivore()) {
      grass = prepareGrass(animal);
      water = prepareWater(animal);
      animal.feed([grass, water]);
    } else if (animal.isCarnivore()) {
      meat = prepareMeat(animal);
      water = prepareWater(animal);
      animal.feed([meat, water]);
    }
  }
}

//------------------------------------------------------------------------------

require('coffee-script');

var core = require('./animals-core');

var prepareGrass = core.prepareGrass;
var prepareMeat  = core.prepareMeat;
var prepareWater = core.prepareWater;

core.run(feedAnimals);
