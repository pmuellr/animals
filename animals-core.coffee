path = require "path"

core = module.exports

#-------------------------------------------------------------------------------
core.run = (func) ->
    animals = getAnimals()
    func animals.slice(0,2) # only feed 1st two animals
    test animals

#-------------------------------------------------------------------------------
test = (animals) ->
    reports = []
    for animal in animals
        animal.report reports
        
    if reports.length != 6
        allReports = reports.join "\n"
        fail "expecting 6 reports, but got: \n#{allReports}" 
    
    expecteds = [
        "lion will be eating meat"
        "lion will be drinking water"
        "cow will be eating grass"
        "cow will be drinking water"
        "eagle was given nothing"
        "hen was given nothing"
    ]
    
    for i in [0..reports.length]
        if expecteds[i] != reports[i]
            fail "expected '#{expecteds[i]}' but got '#{reports[i]}'"
        
    succeed()

#-------------------------------------------------------------------------------
fail = (message) ->
    log "RESULT: FAIL: #{message}"
    process.exit()

#-------------------------------------------------------------------------------
succeed = ->
    log "RESULT: SUCCEED"

#-------------------------------------------------------------------------------
log = (string) ->
    program = path.basename process.argv[1]
    console.log "#{right(program,20)}: #{string}"

#-------------------------------------------------------------------------------
right = (string, length) ->
    while string.length < length
        string += " "
    string

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
core.prepareFood = (animal) ->
    animal.prepareFood animal.getDefaultFood()

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
            reports.push "#{@name} was given nothing"
            return

        for report in @reports
            reports.push report
    
    #---------------------------------------------------------------------------
    prepareFood: (food) ->
        "#{@name} will be eating #{food}"
    
    #---------------------------------------------------------------------------
    prepareWater: ->
        "#{@name} will be drinking water"

    #---------------------------------------------------------------------------
    getDefaultFood: ->
        throw new Error "subclass responsibility"
    
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
    getDefaultFood: ->
        "meat"

#-------------------------------------------------------------------------------
class Herbivore extends Animal 

    #---------------------------------------------------------------------------
    constructor: (@name) ->
        super @name, false

    #---------------------------------------------------------------------------
    isHerbivore: ->
        true
    
    #---------------------------------------------------------------------------
    getDefaultFood: ->
        "grass"

