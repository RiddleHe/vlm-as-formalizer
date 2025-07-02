(define (problem blocksworld2)
    (:domain blocksworld)
    (:objects
        orange - block, 
        purple - block,
        green - block,
        blue - block,
        yellow - block,
        red - block,
        black - block, ; Assuming black is also part of the scene even though not used in the instruction
        robot1 - robot
    )
    (:init
        (on orange purple)
        (on purple green)
        (ontable green)
        (clear yellow)
        (ontable yellow)
        (clear blue) ; Assuming blue is on the table
        (ontable blue)
        (clear red) ; Assuming red is on the table
        (ontable red)
        (clear black) ; Black is clear and on the table
        (ontable black)
        (handempty robot1)
    )
    (:goal (and
        (on orange purple)
        (on purple green)
        (on green blue)
        (on blue yellow)
        (on yellow red)
    ))
)