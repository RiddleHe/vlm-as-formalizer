(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        green_block - block
        yellow_block - block
        purple_block - block
        red_block - block
        orange_block - block
        robot_arm - robot
    )
    (:init
        (ontable blue_block)
        (ontable green_block)
        (ontable yellow_block)
        (ontable purple_block)
        (ontable red_block)
        (ontable orange_block)
        (clear blue_block)
        (clear green_block)
        (clear yellow_block)
        (clear purple_block)
        (clear red_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on purple_block green_block)
  (on red_block yellow_block)
  (on orange_block blue_block)
)))
