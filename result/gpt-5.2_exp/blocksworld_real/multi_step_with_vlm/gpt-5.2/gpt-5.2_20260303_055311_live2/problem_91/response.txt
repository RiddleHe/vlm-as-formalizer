(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        blue_block - block
        purple_block - block
        yellow_block - block
        orange_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (on green_block blue_block)
        (on yellow_block red_block)
        (ontable purple_block)
        (ontable red_block)
        (clear green_block)
        (clear purple_block)
        (clear yellow_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and
    (on orange_block purple_block)
    (on purple_block red_block)
    (on red_block yellow_block)
    (on yellow_block green_block)
    (on green_block blue_block)
  )
))
