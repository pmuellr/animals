#!/usr/bin/env coffee

#-------------------------------------------------------------------------------

feedAnimals = (animals) ->
  for animal in animals
    feedAnimal animal

feedAnimal = (animal) ->
  food = animal.getFood()
  water = animal.getWater()
  animal.feed [food, water]

#-------------------------------------------------------------------------------

core = require './animals-core'

core.run (animals) ->
    feedAnimals animals.slice(0,2)

