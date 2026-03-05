(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent
        red_microwave - microwave
        black_fridge - fridge
        sink - sink
        knife - knife
        black_bowl - receptacle
        blue_plate - receptacle
        green_plate - receptacle
        black_cup - receptacle
        red_cup - receptacle
        brown_bread - object
        green_lettuce - object
        apple_piece - object
    )
    (:init
        (openable red_microwave)
        (openable black_fridge)
        (inReceptacle black_cup red_microwave)
        (inReceptacle red_cup red_microwave)
        (inReceptacle apple_piece blue_plate)
        (atLocation agent knife) ; Assuming agent starts near knife as it's on counter
    )
    (:goal
        (and
            (inReceptacle blue_plate black_fridge)
            (inReceptacle knife black_fridge)
            (inReceptacle apple_piece black_fridge)
        )
    )
)