#!/usr/bin/env node

//------------------------------------------------------------------------------

function feedAnimals(animals) {
  for (var i = 0; i < animals.length; i++)
    feedAnimal(animals[i]);
}

function feedAnimal(animal) {
  var food = prepareFood(animal);
  var water = prepareWater(animal);
  animal.feed([food, water]);
}

//------------------------------------------------------------------------------

require('coffee-script');

var core = require('./animals-core');

var prepareFood  = core.prepareFood;
var prepareWater = core.prepareWater;

core.run(feedAnimals);
