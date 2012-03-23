#!/usr/bin/env coffee

#-------------------------------------------------------------------------------

feedAnimals = (animals) ->
  for animal in animals
    feedAnimal animal

feedAnimal = (animal) ->
  food = prepareFood animal
  water = prepareWater animal
  animal.feed [food, water]

#-------------------------------------------------------------------------------

core = require './animals-core'

prepareFood  = core.prepareFood
prepareWater = core.prepareWater

core.run feedAnimals

