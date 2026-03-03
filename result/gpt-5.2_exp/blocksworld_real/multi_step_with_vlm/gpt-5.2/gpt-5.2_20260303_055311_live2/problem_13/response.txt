(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        yellow_block - block
        purple_block - block
        green_block - block
        red_block - block
        orange_block - block
        robot_arm - robot
    )
    (:init
        (on blue_block purple_block)
        (on purple_block yellow_block)
        (on green_block red_block)
        (ontable yellow_block)
        (ontable orange_block)
        (clear blue_block)
        (clear green_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on blue_block yellow_block)
    (on orange_block red_block)
    (on red_block purple_block)
    (on purple_block green_block)
  )
))
