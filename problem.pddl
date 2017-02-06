(define (problem navigation-cost)
 (:domain petlon)
 (:objects
	init - initial
	n1 n2 - newsstand
	f1 f2 - fridge
	p1 p2 - person
	d1 d2 - door
	cor r1 r2 - room	
 )
 (:init
	(beside init)
	(at cor)
	(hasdoor r1 d1)
	(hasdoor r1 d2)
	(hasdoor cor d1)
	(hasdoor cor d2)
	(inside p1 r1)
	(inside p2 cor)
    (located n1 cor)
	(located n2 cor)
	(located f1 cor)
	(located f2 r1)
	(located init cor)

	(= (total-cost) 0)
	(= (cost init n1) 10)
	(= (cost init n2) 20)
	(= (cost init f1) 10)
	(= (cost init f2) 20)
	(= (cost init p1) 10)
	(= (cost init p2) 20)
	(= (cost init d1) 10)
	(= (cost init d2) 20)
	(= (cost n1 n2) 20)
	(= (cost n1 f1) 10)
	(= (cost n1 f2) 20)
	(= (cost n1 p1) 10)
	(= (cost n1 p2) 20)
	(= (cost n1 d1) 10)
	(= (cost n1 d2) 20)
	(= (cost n2 f1) 10)
	(= (cost n2 f2) 20)
	(= (cost n2 p1) 10)
	(= (cost n2 p2) 20)
	(= (cost n2 d1) 10)
	(= (cost n2 d2) 20)
	(= (cost f1 f2) 20)
	(= (cost f1 p1) 10)
	(= (cost f1 p2) 20)
	(= (cost f1 d1) 10)
	(= (cost f1 d2) 20)
	(= (cost f2 p1) 10)
	(= (cost f2 p2) 20)
	(= (cost f2 d1) 10)
	(= (cost f2 d2) 20)
	(= (cost p1 p2) 20)
	(= (cost p1 d1) 10)
	(= (cost p1 d2) 20)
	(= (cost p2 d1) 10)
	(= (cost p2 d2) 20)
	(= (cost d1 d2) 20)
  )
  (:goal (and (or (delivered n1 p1)
			      (delivered n2 p1))
			  (or (delivered f1 p1)
			      (delivered f2 p1))
	     )
   )
  (:metric minimize (total-cost))
)
