(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        Block_Red - block
        Block_Blue - block
        Block_Orange - block
        Block_Yellow - block
        Block_Purple - block
        Block_Green - block
        Robot_Arm - robot
    )
    (:init
        (on Block_Red Block_Blue)
        (on Block_Blue Block_Yellow)
        (on Block_Yellow Block_Green)
        (on Block_Green Block_Orange)
        (on Block_Orange Block_Purple)
        (ontable Block_Purple)
        (clear Block_Red)
        (handempty Robot_Arm)
    )
    (:goal (and
        (on Block_Red Block_Blue)
        (ontable Block_Blue)
        (clear Block_Red)
        (on Block_Orange Block_Yellow)
        (ontable Block_Yellow)
        (clear Block_Orange)
        (on Block_Purple Block_Green)
        (ontable Block_Green)
        (clear Block_Purple)
    ))
)