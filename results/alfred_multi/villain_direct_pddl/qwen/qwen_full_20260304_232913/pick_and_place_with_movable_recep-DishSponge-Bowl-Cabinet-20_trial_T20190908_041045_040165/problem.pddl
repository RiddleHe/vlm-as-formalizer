(define (problem put_bowl_in_cupboard)
    (:domain put_task)
    (:objects
        agent1 - agent
        bowl - object
        cupboard_left_of_dishwasher - receptacle
    )
    (:init
        (atLocation agent1 bowl)
        (openable cupboard_left_of_dishwasher)
        (not (opened cupboard_left_of_dishwasher))
        (not (holdsAny agent1))
        (not (inReceptacle bowl cupboard_left_of_dishwasher))
    )
    (:goal
        (and
            (inReceptacle bowl cupboard_left_of_dishwasher)
        )
    )
)