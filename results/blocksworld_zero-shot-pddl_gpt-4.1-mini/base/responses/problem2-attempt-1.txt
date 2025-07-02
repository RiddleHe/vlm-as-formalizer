(define (problem stack_blocks1)
    (:domain blocksworld)
    (:objects
        pink purple blue red robot1
    )
    (:init
        (ontable pink)
        (ontable purple)
        (ontable blue)
        (ontable red)
        (clear pink)
        (clear purple)
        (clear blue)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on red blue)
        (on blue purple)
        (on purple pink)
    ))
)