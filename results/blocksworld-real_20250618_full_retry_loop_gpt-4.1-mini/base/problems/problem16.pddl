(define (problem stack_green_red_orange_purple_blue_yellow)
    (:domain blocksworld)
    (:objects
        green red orange purple blue yellow - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (ontable red)
        (ontable orange)
        (ontable purple)
        (ontable blue)
        (ontable yellow)
        (clear green)
        (clear red)
        (clear orange)
        (clear purple)
        (clear blue)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on green red)
        (on red orange)
        (on orange purple)
        (on purple blue)
        (on blue yellow)
    ))
)