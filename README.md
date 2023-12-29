## De engelse vertaling vindt u verderop (Please find the english version below)
# Project: Caching Inverse Matrix in R

## Inleiding

Deze tweede programmeeropdracht vereist het schrijven van een R-functie die in staat is om mogelijk tijdrovende berekeningen te cachen. Bijvoorbeeld, het nemen van het gemiddelde van een numerieke vector is doorgaans een snelle bewerking. Echter, voor een zeer lange vector kan het te lang duren om het gemiddelde te berekenen, vooral als het herhaaldelijk moet worden berekend (bijvoorbeeld in een lus). Als de inhoud van een vector niet verandert, kan het zinvol zijn om de waarde van het gemiddelde te cachen, zodat wanneer we het opnieuw nodig hebben, het kan worden opgezocht in de cache in plaats van opnieuw te worden berekend. In deze programmeeropdracht maak je gebruik van de scope-regels van de R-taal en hoe ze kunnen worden gemanipuleerd om de toestand binnen een R-object te behouden.

Voorbeeld: Cachen van het Gemiddelde van een Vector

In dit voorbeeld introduceren we de <<- operator die kan worden gebruikt om een waarde toe te wijzen aan een object in een omgeving die verschilt van de huidige omgeving. Hieronder staan twee functies die worden gebruikt om een speciaal object te maken dat een numerieke vector opslaat en het gemiddelde ervan cacht.

De eerste functie, makeVector, creëert een speciale "vector", die eigenlijk een lijst is met een functie om de waarde van de vector in te stellen, de waarde van de vector op te vragen, de waarde van het gemiddelde in te stellen en de waarde van het gemiddelde op te vragen.


makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

De volgende functie berekent het gemiddelde van de speciale "vector" die is gemaakt met de bovenstaande functie. Het controleert echter eerst of het gemiddelde al is berekend. Zo ja, dan haalt het het gemiddelde uit de cache en slaat de berekening over. Anders berekent het het gemiddelde van de gegevens en stelt de waarde van het gemiddelde in de cache via de setmean functie.


cachemean <- function(x, ...) {
  m <- x$getmean()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

Opdracht: Cachen van de Inverse van een Matrix

Matrixinversie is meestal een kostbare berekening en het kan voordelig zijn om de inverse van een matrix te cachen in plaats van deze herhaaldelijk te berekenen (er zijn ook alternatieven voor matrixinversie die we hier niet zullen bespreken). Jouw opdracht is om een paar functies te schrijven die de inverse van een matrix cachen.

Schrijf de volgende functies:

makeCacheMatrix: Deze functie creëert een speciaal "matrix"-object dat zijn inverse kan cachen.
cacheSolve: Deze functie berekent de inverse van de speciale "matrix" die wordt geretourneerd door makeCacheMatrix hierboven. Als de inverse al is berekend (en de matrix is niet gewijzigd), moet cacheSolve de inverse uit de cache halen.
Het berekenen van de inverse van een vierkante matrix kan worden gedaan met de solve functie in R. Als bijvoorbeeld X een vierkante inverteerbare matrix is, retourneert solve(X) de inverse ervan.

Voor deze opdracht wordt aangenomen dat de geleverde matrix altijd inverteerbaar is.

Om deze opdracht te voltooien, moet je het volgende doen:

Fork de GitHub-repository met de stub R-bestanden op https://github.com/rdpeng/ProgrammingAssignment2 om een kopie onder jouw eigen account te maken.
Kloon je geforkte GitHub-repository naar je computer, zodat je de bestanden lokaal op je eigen machine kunt bewerken.
Bewerk het R-bestand in de git-repository en plaats je oplossing in dat bestand (hernoem het bestand niet).
Commit je voltooide R-bestand naar JOUW git-repository en push je git-tak naar de GitHub-repository onder jouw account.

# The English version)
## Project caching inverse Matrix in R
### Introduction

This second project programming assignment will require you to write an R
function that is able to cache potentially time-consuming computations.
For example, taking the mean of a numeric vector is typically a fast
operation. However, for a very long vector, it may take too long to
compute the mean, especially if it has to be computed repeatedly (e.g.
in a loop). If the contents of a vector are not changing, it may make
sense to cache the value of the mean so that when we need it again, it
can be looked up in the cache rather than recomputed. In this
Programming Assignment you will take advantage of the scoping rules of
the R language and how they can be manipulated to preserve state inside
of an R object.

### Example: Caching the Mean of a Vector

In this example we introduce the `<<-` operator which can be used to
assign a value to an object in an environment that is different from the
current environment. Below are two functions that are used to create a
special object that stores a numeric vector and caches its mean.

The first function, `makeVector` creates a special "vector", which is
really a list containing a function to

1.  set the value of the vector
2.  get the value of the vector
3.  set the value of the mean
4.  get the value of the mean

<!-- -->

    makeVector <- function(x = numeric()) {
            m <- NULL
            set <- function(y) {
                    x <<- y
                    m <<- NULL
            }
            get <- function() x
            setmean <- function(mean) m <<- mean
            getmean <- function() m
            list(set = set, get = get,
                 setmean = setmean,
                 getmean = getmean)
    }

The following function calculates the mean of the special "vector"
created with the above function. However, it first checks to see if the
mean has already been calculated. If so, it `get`s the mean from the
cache and skips the computation. Otherwise, it calculates the mean of
the data and sets the value of the mean in the cache via the `setmean`
function.

    cachemean <- function(x, ...) {
            m <- x$getmean()
            if(!is.null(m)) {
                    message("getting cached data")
                    return(m)
            }
            data <- x$get()
            m <- mean(data, ...)
            x$setmean(m)
            m
    }

### Assignment: Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly (there are also alternatives to matrix inversion that we will
not discuss here). Your assignment is to write a pair of functions that
cache the inverse of a matrix.

Write the following functions:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

Computing the inverse of a square matrix can be done with the `solve`
function in R. For example, if `X` is a square invertible matrix, then
`solve(X)` returns its inverse.

For this assignment, assume that the matrix supplied is always
invertible.

In order to complete this assignment, you must do the following:

1.  Fork the GitHub repository containing the stub R files at
    [https://github.com/rdpeng/ProgrammingAssignment2](https://github.com/rdpeng/ProgrammingAssignment2)
    to create a copy under your own account.
2.  Clone your forked GitHub repository to your computer so that you can
    edit the files locally on your own machine.
3.  Edit the R file contained in the git repository and place your
    solution in that file (please do not rename the file).
4.  Commit your completed R file into YOUR git repository and push your
    git branch to the GitHub repository under your account.


### project assignment 
