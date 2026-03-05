(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        green_block
        blue_block
        orange_block
        yellow_block
        red_block
        purple_block
        robot1
    )
    (:init
        (ontable green_block)
        (ontable blue_block)
        (ontable orange_block)
        (ontable yellow_block)
        (on red_block yellow_block)
        (on purple_block red_block)
        (clear green_block)
        (clear blue_block)
        (clear orange_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on orange_block purple_block)
        (on purple_block red_block)
        (on red_block blue_block)
        (on blue_block yellow_block)
        (on yellow_block green_block)
        (clear orange_block)
        (ontable green_block)
    ))
)