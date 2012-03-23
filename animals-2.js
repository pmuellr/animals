#!/usr/bin/env node

//------------------------------------------------------------------------------

function feedAnimals(animals) {
  for (var i = 0; i < animals.length; i++)
    feedAnimal(animals[i]);
}

function feedAnimal(animal) {
  if (animal.isHerbivore()) 
    feedHerbivore(animal);
  else if (animal.isCarnivore())
    feedCarnivore(animal);
}

function feedHerbivore(herbivore) {
  var grass = core.prepareGrass(herbivore);
  var water = core.prepareWater(herbivore);
  herbivore.feed([grass, water]);
}

function feedCarnivore(carnivore) {
  var meat = core.prepareMeat(carnivore);
  var water = core.prepareWater(carnivore);
  carnivore.feed([meat, water]);
}

//------------------------------------------------------------------------------

require('coffee-script')

var core = require('./animals-core')

core.run(function(animals) {
    feedAnimals(animals.slice(0,2))
})
