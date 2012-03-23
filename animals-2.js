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
  var grass = prepareGrass(herbivore);
  var water = prepareWater(herbivore);
  herbivore.feed([grass, water]);
}

function feedCarnivore(carnivore) {
  var meat = prepareMeat(carnivore);
  var water = prepareWater(carnivore);
  carnivore.feed([meat, water]);
}

//------------------------------------------------------------------------------

require('coffee-script');

var core = require('./animals-core');

var prepareGrass = core.prepareGrass;
var prepareMeat  = core.prepareMeat;
var prepareWater = core.prepareWater;

core.run(feedAnimals);
