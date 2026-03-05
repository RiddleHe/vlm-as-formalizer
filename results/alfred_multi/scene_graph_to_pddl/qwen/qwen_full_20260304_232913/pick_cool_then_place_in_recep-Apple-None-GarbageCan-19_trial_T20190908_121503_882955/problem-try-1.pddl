(define (problem chill_apple_and_put_in_bin)
    (:domain put_task)
    (:objects
        agent
        black_microwave - microwave
        black_fridge - fridge
        sink - sink
        yellow_knife - knife
        gray_trash_bin - receptacle
        red_apple - object
        brown_egg - object
    )
    (:init
        (openable black_microwave)
        (openable black_fridge)
        (opened black_microwave)
        (inReceptacle red_apple black_microwave)
        (inReceptacle brown_egg black_microwave)
        (inReceptacle yellow_knife black_microwave)
        (atLocation agent black_microwave)
    )
    (:goal (and
        (inReceptacle red_apple gray_trash_bin)
        (isCool red_apple)
    ))
)