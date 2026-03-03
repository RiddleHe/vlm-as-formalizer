(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        green_block - block
        orange_block - block
        red_block - block
        purple_block - block
        yellow_block - block
        robot_arm - robot
    )
    (:init
        (on orange_block red_block)
        (on red_block green_block)
        (ontable blue_block)
        (ontable orange_block)
        (ontable purple_block)
        (ontable yellow_block)
        (clear blue_block)
        (clear green_block)
        (clear purple_block)
        (clear yellow_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on blue_block orange_block)
  (on purple_block green_block)
  (on yellow_block red_block)
)))
