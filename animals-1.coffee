#!/usr/bin/env coffee

#-------------------------------------------------------------------------------

feedAnimals = (animals) ->

  for animal in animals
    if animal.isHerbivore()
      grass = prepareGrass animal
      water = prepareWater animal
      animal.feed [grass, water]
    else if animal.isCarnivore()
      meat = prepareMeat animal
      water = prepareWater animal
      animal.feed [meat, water]

#-------------------------------------------------------------------------------

core = require './animals-core'

prepareGrass = core.prepareGrass
prepareMeat  = core.prepareMeat
prepareWater = core.prepareWater

core.run feedAnimals

