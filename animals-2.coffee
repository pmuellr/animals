#!/usr/bin/env coffee

#-------------------------------------------------------------------------------

feedAnimals = (animals) ->
  for animal in animals
    feedAnimal animal

feedAnimal = (animal) ->
  if animal.isHerbivore()
    feedHerbivore animal
  else if animal.isCarnivore()
    feedCarnivore animal

feedHerbivore = (herbivore) ->
  grass = core.prepareGrass(herbivore)
  water = core.prepareWater(herbivore)
  herbivore.feed [grass, water]

feedCarnivore = (carnivore) ->
  meat = core.prepareMeat(carnivore)
  water = core.prepareWater(carnivore)
  carnivore.feed [meat, water]

#-------------------------------------------------------------------------------

core = require './animals-core'

core.run (animals) ->
    feedAnimals animals.slice(0,2)

