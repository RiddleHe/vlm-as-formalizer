(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        purple - block
        orange - block
        green - block
        red - block
        yellow - block
        robot1 - robot
    )
    (:init
        ; Initial conditions provided based on analysis
        (ontable blue)
        (ontable purple)
        (ontable orange)
        (on green red)
        (ontable red)
        (ontable yellow)
        (clear blue)
        (clear purple)
        (clear orange)
        (clear yellow)
        (clear green)
        (handempty robot1)
    )
    (:goal 
        (and
            ; Stack 1: orange over purple over blue
            (on orange purple)
            (on purple blue)
            ; Stack 2: yellow over red over green
            (on yellow red)
            (on red green)
        )
    )
)