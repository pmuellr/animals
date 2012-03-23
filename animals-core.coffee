path = require "path"

core = module.exports

#-------------------------------------------------------------------------------
core.run = (func) ->
    begin()
    animals = getAnimals()
    func animals.slice(0,2) # only feed 1st two animals
    end animals

#-------------------------------------------------------------------------------
begin = ->
    program = path.basename process.argv[1]
    console.log ""
    console.log "-----------------------------------------------------"
    console.log "running #{program}"
    console.log "-----------------------------------------------------"

#-------------------------------------------------------------------------------
end = (animals) ->
    reports = []
    for animal in animals
        animal.report(reports)
        
    fail "expecting 6 reports" if reports.length != 6
    
    expecteds = [
        "lion is eating meat"
        "lion is drinking water"
        "cow is eating grass"
        "cow is drinking water"
        "eagle was given nothing"
        "hen was given nothing"
    ]
    
    for i in [0..reports.length]
        fail "wrong report for report #{i}" if expecteds[i] != reports[i]
        
    succeed()

#-------------------------------------------------------------------------------
fail = (message) ->
    console.log "RESULT: FAIL: #{message}"
    process.exit()

#-------------------------------------------------------------------------------
succeed = ->
    console.log "RESULT: SUCCEED"

#-------------------------------------------------------------------------------
getAnimals = ->
    [ 
        new Carnivore "lion"
        new Herbivore "cow"
        new Carnivore "eagle"
        new Herbivore "hen"
    ]

#-------------------------------------------------------------------------------
core.prepareGrass = (animal) ->
    animal.prepareFood "grass"

#-------------------------------------------------------------------------------
core.prepareMeat = (animal) ->
    animal.prepareFood "meat"

#-------------------------------------------------------------------------------
core.prepareWater = (animal) ->
    animal.prepareWater()

#-------------------------------------------------------------------------------
class Animal

    #---------------------------------------------------------------------------
    constructor: (@name) ->
        @reports = []
        
    #---------------------------------------------------------------------------
    feed: (items) ->
        for item in items
            @reports.push item

    #---------------------------------------------------------------------------
    report: (reports) ->
        if !@reports.length 
            message = "#{@name} was given nothing"
            reports.push message
            console.log message
            return

        for report in @reports
            reports.push report
            console.log report
    
    #---------------------------------------------------------------------------
    prepareFood: (food) ->
        "#{@name} is eating #{food}"
    
    #---------------------------------------------------------------------------
    prepareWater: ->
        "#{@name} is drinking water"

    #---------------------------------------------------------------------------
    getFood: ->
        throw new Error "subclass responsibility"
    
    #---------------------------------------------------------------------------
    getWater: ->
        @prepareWater()
    
    #---------------------------------------------------------------------------
    isCarnivore: ->
        false
    
    #---------------------------------------------------------------------------
    isHerbivore: ->
        false


#-------------------------------------------------------------------------------
class Carnivore extends Animal 

    #---------------------------------------------------------------------------
    constructor: (@name) ->
        super @name, true

    #---------------------------------------------------------------------------
    isCarnivore: ->
        true

    #---------------------------------------------------------------------------
    getFood: ->
        @prepareFood "meat"

#-------------------------------------------------------------------------------
class Herbivore extends Animal 

    #---------------------------------------------------------------------------
    constructor: (@name) ->
        super @name, false

    #---------------------------------------------------------------------------
    isHerbivore: ->
        true
    
    #---------------------------------------------------------------------------
    getFood: ->
        @prepareFood "grass"

