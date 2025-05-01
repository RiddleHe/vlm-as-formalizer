(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        yellow pink green red purple blue - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (ontable purple)
        (ontable blue)
        (on orange purple)
        (on red orange)
        (clear yellow)
        (clear red)
        (clear blue)
        (clear purple)
        (clear pink)
        (clear orange)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on yellow pink)
        (on pink green)
        (on green red)
        (on red purple)
        (on purple blue)
    ))
)