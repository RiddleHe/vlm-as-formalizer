(define (problem blocksworld)    (:domain blocksworld)    (:objects
        yellow_block - block
        purple_block - block
        green_block - block
        red_block - block
        blue_block - block
        orange_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block purple_block)
        (on green_block purple_block)
        (on red_block green_block)
        (on blue_block red_block)
        (on orange_block blue_block)
        (ontable orange_block)
        (clear yellow_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on orange_block red_block)
    (on yellow_block blue_block)
    (on purple_block green_block)
  )
))
