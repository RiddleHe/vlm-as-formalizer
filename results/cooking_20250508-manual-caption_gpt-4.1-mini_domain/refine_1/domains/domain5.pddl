(define (domain cooking)
    (:requirements :strips :typing)
    (:types
        robot
        object
        vegetable - object
        tool - object
        location
    )
    (:predicates
        (holding ?robot - robot ?obj - object)
        (at ?obj - object ?loc - location)
        (free ?robot - robot)
        (sliced ?veg - vegetable)
        (on_cutting_board ?veg - vegetable)
        (has_tool ?robot - robot ?tool - tool)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (free ?robot) (not (holding ?robot ?obj)) (at ?robot ?pick_loc))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)) (not (free ?robot)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (and (holding ?robot ?obj) (at ?robot ?place_loc))
        :effect (and
            (at ?obj ?place_loc)
            (not (holding ?robot ?obj))
            (free ?robot)
            ;; If placing vegetable on cutting_board, then set on_cutting_board
            (when (and (vegetable ?obj) (on-cutting-board-location ?place_loc))
                (on_cutting_board ?obj))
            ;; If placing vegetable not on cutting_board, then remove on_cutting_board
            (when (and (vegetable ?obj) (not (on-cutting-board-location ?place_loc)))
                (not (on_cutting_board ?obj)))
        )
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?tool) (at ?veg ?loc) (at ?robot ?loc) (on_cutting_board ?veg))
        :effect (and (sliced ?veg))
    )
)