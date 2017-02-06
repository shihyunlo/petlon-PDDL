(define (domain petlon)

    (:requirements :typing :action-costs :strips :adl)

    (:types 
        person door container - thing
        newsstand fridge table printer initial - container 
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
    
    (:functions (total-cost) - number
		 (cost ?t1 ?t2 - thing) - number)

    (:action movetoroom
        :parameters (?r1 ?r2 - room ?from - thing ?to - door)
        :precondition (and (at ?r1)
                           (hasdoor ?r1 ?to)			     
			    		   (beside ?from)
			    		   (hasdoor ?r2 ?to)
                      )
        :effect (and (beside ?to)
                     (at ?r2)
                     (not (beside ?from))
                     (not (at ?r1))
                     (increase (total-cost) (cost ?from ?to))
                )
    )
    (:action movetothing
        :parameters (?r - room ?from - thing ?to - thing)
        :precondition (and (at ?r)
			    		   (beside ?from)
                           (or (hasdoor ?r ?to)
							   (located ?to ?r)
							   (inside ?to ?r)
						   )   
                      )
        :effect (and (beside ?to)
                     (at ?r)
                     (not (beside ?from))
                     (increase (total-cost) (cost ?from ?to))
                )
    )

    (:action load
        :parameters (?to - container)
        :precondition (and (beside ?to)
                      )
        :effect (and (loaded ?to)
                )
    )

    (:action deliver
        :parameters (?p - person ?c - container)
        :precondition (and (loaded ?c)
			               (beside ?p)
                       )
        :effect (and (delivered ?c ?p)
			         (not (loaded ?c))
                )
    )
 
)

