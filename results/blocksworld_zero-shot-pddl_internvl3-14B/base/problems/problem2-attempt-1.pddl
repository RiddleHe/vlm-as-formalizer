(define (problem blocksworld-stack)
    (:domain blocksworld)
    (:objects
        pink - block
        purple - block
        blue - block
        red - block
        robot1 - robot
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
        (not (handfull robot1))
        (not (holding robot1))
        (on blue purple)
        (on purple pink)
    )
    (:goal (and
        (on red blue)
        (on blue purple)
        (on purple pink)
        (clear red)
        (not (ontable red))
        (not (ontable blue))
        (not (ontable purple))
        (not (ontable pink))
    ))
)