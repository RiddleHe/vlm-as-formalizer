(define (domain cooking)
    (:requirements :strips)
    (:predicates
        (sliced ?x)
        (in-bowl ?x)
        (clear ?x)
        (holding ?x)
    )
    (:action slice
        :parameters (?carrot)
        :precondition (and (clear ?carrot) (not (sliced ?carrot)) (holding ?carrot))
        :effect (and (sliced ?carrot) (not (holding ?carrot)))
    )
    (:action place-in-bowl
        :parameters (?carrot ?bowl)
        :precondition (and (sliced ?carrot) (clear ?bowl) (holding ?carrot))
        :effect (and (in-bowl ?carrot) (clear ?carrot) (not (holding ?carrot)))
    )
)