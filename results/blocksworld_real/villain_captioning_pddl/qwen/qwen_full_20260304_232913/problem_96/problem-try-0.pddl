(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        Block_Red
        Block_Yellow
        Block_Purple
        Block_Blue
        Block_Green
        Block_Orange
        Robot1 - robot
    )
    (:init
        (on Block_Red Block_Yellow)
        (on Block_Yellow Block_Purple)
        (on Block_Purple Block_Blue)
        (on Block_Blue Block_Green)
        (ontable Block_Green)
        (ontable Block_Orange)
        (clear Block_Red)
        (clear Block_Orange)
        (handempty Robot1)
    )
    (:goal (and
        (on Block_Yellow Block_Blue)
        (on Block_Purple Block_Red)
        (on Block_Red Block_Green)
        (on Block_Green Block_Orange)
        (ontable Block_Orange)
        (clear Block_Yellow)
        (clear Block_Purple)
    ))
)