(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        purple - block
        blue - block
        green - block
        yellow - block
        red - block
        orange - block
        robot1 - robot
    )
    (:init
        (on purple blue)
        (on blue green)
        (on green yellow)
        (on yellow red)
        (ontable red)
        (ontable orange)
        (clear purple)
        (clear orange)
        (handempty robot1)
        (not (handfull robot1))
        (not (holding robot1 purple))
        (not (holding robot1 blue))
        (not (holding robot1 green))
        (not (holding robot1 yellow))
        (not (holding robot1 red))
        (not (holding robot1 orange))
    )
    (:goal
        (and
            (on purple blue)
            (clear blue)
            (on blue green)
            (clear green)
            (on green yellow)
            (clear yellow)
            (on yellow red)
            (clear red)
            (on red orange)
            (clear orange)
            (ontable nil)
        )
    )
)