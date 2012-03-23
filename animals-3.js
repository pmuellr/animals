#!/usr/bin/env node

//------------------------------------------------------------------------------

function feedAnimals(animals) {
  for (var i = 0; i < animals.length; i++)
    feedAnimal(animals[i]);
}

function feedAnimal(animal) {
  var food = animal.getFood();
  var water = animal.getWater();
  animal.feed([food, water]);
}

//------------------------------------------------------------------------------

require('coffee-script')

var core = require('./animals-core')

core.run(function(animals) {
    feedAnimals(animals.slice(0,2))
})
