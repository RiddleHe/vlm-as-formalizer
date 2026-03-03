(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        orange_block - block
        yellow_block - block
        red_block - block
        blue_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block red_block)
        (on purple_block blue_block)
        (ontable green_block)
        (ontable orange_block)
        (ontable blue_block)
        (ontable purple_block)
        (clear green_block)
        (clear orange_block)
        (clear blue_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on purple_block red_block)
  (on red_block blue_block)
  (on blue_block yellow_block)
  (on yellow_block orange_block)
  (on orange_block green_block)
)))
