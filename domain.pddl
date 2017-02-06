(define (domain petlon)

    (:requirements :typing :action-costs)

    (:types 
        person door container - thing
        newsstand fridge initial - container 
        room
    )

    (:predicates
        (at ?r - room)
        (hasdoor ?r - room ?d - door)
        (located ?c - container ?r - room)
        (inside ?p - person ?r - room)
        (beside ?t - thing)
        (loaded ?c - container)
        (delivered ?c - container ?p - person)
    )
    
    (:functions 
	     (total-cost) - number
		 (cost ?t1 ?t2 - thing) - number
    )

    (:action moveto
        :parameters (?r1 ?r2 - room ?from - thing ?to - door)
        :precondition (and (at ?r1)
                           (hasdoor ?r1 ?to)			     
			    		   (beside ?from)
			    		   (hasdoor ?r2 ?to)
                      )
        :effect (and (beside ?to)
                     (at ?r2)
                     (increase (total-cost) (cost ?from ?to))
                )
    )

    (:action visit
        :parameters (?r - room ?from - door ?to - container)
        :precondition (and (at ?r)
			                (beside ?from)
                            (located ?to ?r)
                      )
        :effect (and (beside ?to)
                     (loaded ?to)
                     (increase (total-cost) (cost ?from ?to))
                )
    )

    (:action deliver
        :parameters (?to - person ?r - room ?from - door ?c - container)
        :precondition (and (loaded ?c)
			               (beside ?from)
                           (at ?r) 
			               (inside ?to ?r)
                       )
        :effect (and (delivered ?c ?to)
                     (beside ?to)
                     (not (loaded ?c))
                     (increase (total-cost) (cost ?from ?to))
                )
    )
 
)

