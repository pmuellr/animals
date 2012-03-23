#!/usr/bin/env coffee

#-------------------------------------------------------------------------------

feedAnimals = (animals) ->

  for animal in animals
    if animal.isHerbivore()
      grass = core.prepareGrass animal
      water = core.prepareWater animal
      animal.feed [grass, water]
    else if animal.isCarnivore()
      meat = core.prepareMeat animal
      water = core.prepareWater animal
      animal.feed [meat, water]

#-------------------------------------------------------------------------------

core = require './animals-core'

core.run (animals) ->
    feedAnimals animals.slice(0,2)

