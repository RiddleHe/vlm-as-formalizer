(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        Block-Orange - block
        Block-Red - block
        Block-Purple - block
        Block-Blue - block
        Block-Yellow - block
        Block-Green - block
        Robot - robot
    )
    (:init
        (ontable Block-Orange)
        (ontable Block-Green)
        (on Block-Purple Block-Orange)
        (on Block-Red Block-Purple)
        (on Block-Yellow Block-Green)
        (on Block-Blue Block-Yellow)
        (clear Block-Red)
        (clear Block-Blue)
        (handempty Robot)
        (not (handfull Robot))
        (not (holding Block-Orange))
        (not (holding Block-Red))
        (not (holding Block-Purple))
        (not (holding Block-Blue))
        (not (holding Block-Yellow))
        (not (holding Block-Green))
    )
    (:goal (and
        (on Block-Orange Block-Blue)
        (on Block-Red Block-Green)
        (on Block-Yellow Block-Purple)
        (clear Block-Orange)
        (clear Block-Red)
        (clear Block-Yellow)
        (ontable Block-Blue)
        (ontable Block-Green)
        (ontable Block-Purple)
    ))
)