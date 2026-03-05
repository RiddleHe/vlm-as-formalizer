(define (problem put_racket_on_dresser)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_dresser_with_drawers - receptacle
        tennis_racket - object
        laptop_computer - object
        lamp_on_dresser - object
        green_cushion_1 - object
        green_cushion_2 - object
        blue_blanket - object
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
    )
    (:init
        (openable wooden_dresser_with_drawers)
        (atLocation robot tennis_racket)
        (inReceptacle laptop_computer wooden_dresser_with_drawers)
        (inReceptacle lamp_on_dresser wooden_dresser_with_drawers)
        (isOn laptop_computer)
        (isOn lamp_on_dresser)
    )
    (:goal (and (inReceptacle tennis_racket wooden_dresser_with_drawers)))
)