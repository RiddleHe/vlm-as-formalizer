(define (problem blocks_stacking)
    (:domain blocksworld)
    (:objects 
        green
        yellow
        pink
        purple
        orange
        red
        robot1
    )
    (:init
        (ontable green)
        (ontable yellow)
        (ontable pink)
        (ontable purple)
        (ontable orange)
        (ontable red)
        (clear green)
        (clear yellow)
        (clear pink)
        (clear purple)
        (clear orange)
        (clear red)
        (handempty robot1)
    )
    (:goal (and 
        (on green yellow)
        (on yellow pink)
        (ontable pink)
        (on purple orange)
        (on orange red)
        (ontable red)
    ))
)