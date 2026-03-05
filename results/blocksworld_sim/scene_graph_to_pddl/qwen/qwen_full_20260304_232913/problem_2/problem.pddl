(define (problem blocksworld_stack)
    (:domain blocksworld)
    (:objects
        pink_block
        purple_block
        blue_block
        red_block
        robot1 - robot
    )
    (:init
        (ontable pink_block)
        (ontable red_block)
        (on purple_block pink_block)
        (on blue_block purple_block)
        (clear blue_block)
        (clear red_block)
        (clear pink_block)
        (handempty robot1)
    )
    (:goal (and
        (on red_block blue_block)
        (on blue_block purple_block)
        (on purple_block pink_block)
        (ontable pink_block)
        (clear red_block)
    ))
)