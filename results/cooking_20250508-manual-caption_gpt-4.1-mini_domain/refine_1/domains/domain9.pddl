(define (domain cooking)
    (:requirements :strips)
    (:types
        robot
        object
        vegetable - object
        tool - object
        location
        cutting_board - location
        bowl - object
    )
    (:predicates
        (holding ?robot - robot ?obj - object)
        (at ?obj - object ?loc - location)
        (free ?robot - robot)
        (sliced ?veg - vegetable)
        (on_cutting_board ?veg - vegetable ?loc - cutting_board)
        (has_knife ?robot - robot ?knife - tool)
        (bowl ?obj - bowl)
        (cutting_board_loc ?loc - cutting_board)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (at ?robot ?pick_loc) (free ?robot))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)) (not (free ?robot)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (and (holding ?robot ?obj) (at ?robot ?place_loc))
        :effect (and 
            (at ?obj ?place_loc)
            (not (holding ?robot ?obj)) 
            (free ?robot)
            (when (cutting_board_loc ?place_loc)
                (on_cutting_board ?obj ?place_loc)
            )
        )
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - cutting_board)
        :precondition (and (holding ?robot ?tool) (at ?veg ?loc) (cutting_board_loc ?loc) (not (sliced ?veg)))
        :effect (sliced ?veg)
    )
)