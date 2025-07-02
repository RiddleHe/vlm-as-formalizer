(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        yellow_block blue_block orange_block purple_block red_block robot1
    )
    (:init
        (clear yellow_block)
        (clear blue_block)
        (clear orange_block)
        (clear purple_block)
        (on-table yellow_block)
        (on-table blue_block)
        (on-table orange_block)
        (on-table purple_block)
        (on-table red_block)
        (handempty robot1)
    )
    (:goal
        (and 
            (on orange_block yellow_block)
            (on yellow_block blue_block)
            (on blue_block purple_block)
            (on purple_block red_block)
        )
    )
)