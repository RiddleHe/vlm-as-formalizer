(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        pink - block
        purple - block
        blue - block
        red - block
        robot - robot
    )
    (:init
        (on pink purple)
        (on purple blue)
        (ontable blue)
        (clear red)
        (ontable red)
        (handempty robot)
        (clear pink)
    )
    (:goal 
        (and
            (on red blue)
            (on blue purple)
            (on purple pink)
            (clear red)
        )
    )
)