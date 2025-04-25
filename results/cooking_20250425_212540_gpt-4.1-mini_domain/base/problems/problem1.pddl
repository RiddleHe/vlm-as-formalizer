(define (problem slice_cucumber)
    (:domain cooking)
    (:objects
        robot1 - robot
        cucumber1 - vegetable
        knife1 - tool
        bowl1 - object
        table - location
    )
    (:init
        (free_hand robot1)
        (at cucumber1 table)
        (at bowl1 table)
        (at knife1 table)
        (is_cucumber cucumber1)
        (is_bowl bowl1)
        (is_knife knife1)
    )
    (:goal (and (sliced cucumber1) (at cucumber1 bowl1)))
)