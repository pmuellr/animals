A retelling of [Anders Janmyr](http://anders.janmyr.com/)'s 
"[Braceless Programming](http://anders.janmyr.com/2012/03/braceless-programming.html)".

Includes bonus "Object Oriented" implementation, and implementations in CoffeeScript.

Requires node.js, and coffee-script will be installed in this directory for you.

what
----

Clone this repo, then run `make`.  All the 'tests' should SUCCEED.

coding style
------------

I left the `feedAnimals()` function in the style of the author, but the new
code I wrote is in my own style.  Four space indent, lots of whitespace, 
separator comments before functions/methods.  The separator comments are
clearly overkill, as is not single-lining some of the functions/methods,
but in "real life" my code tends to be more complex.

I tended to go "Object Oriented" as I do in real life.

animals-1.js
------------

The first example from the blog post.

animals-2.js
------------

The second example from the blog post.

animals-3.js
------------

Another example, this one assuming animals know what food they eat, by 
using a new top-level function `prepareFood(animal)`.

animals-1.coffee
----------------

CoffeeScript version of `animals-1.js`.

animals-2.coffee
----------------

CoffeeScript version of `animals-2.js`.

animals-3.coffee
----------------

CoffeeScript version of `animals-3.js`.
