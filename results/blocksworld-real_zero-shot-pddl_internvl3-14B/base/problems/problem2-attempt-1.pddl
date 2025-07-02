(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        green - block
        red - block
        purple - block
        blue - block
        orange - block
        yellow - block
    )
    (:init
        ; Assuming robot1 starts clear and on the table
        (handempty robot1)
        (on green yellow)
        (ontable yellow)
        (clear green)
        (clear red)
        (clear purple)
        (clear blue)
        (clear orange)
        ; Adding more predicates as necessary based on the image's hidden stack information
    )
    (:goal 
        (and
            (clear red)
            (clear blue)
            (clear orange)
            (clear yellow)
            (on green red)
            (on red purple)
            (on purple blue)
            (on blue orange)
            (on orange yellow)
            (ontable yellow)
            (handempty robot1)
        )
    )
)