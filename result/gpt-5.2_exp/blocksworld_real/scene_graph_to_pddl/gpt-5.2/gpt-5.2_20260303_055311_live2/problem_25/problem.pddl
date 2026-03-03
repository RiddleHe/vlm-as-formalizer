(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    blue_block purple_block orange_block red_block yellow_block green_block - block
    robot_arm - robot
  )
  (:init
    ;; on relations
    (on blue_block orange_block)
    (on yellow_block red_block)
    (on red_block green_block)

    ;; table placements
    (ontable orange_block)
    (ontable purple_block)
    (ontable green_block)

    ;; clear blocks
    (clear blue_block)
    (clear purple_block)
    (clear yellow_block)

    ;; robot state
    (holding blue_block)
    (handfull robot_arm)
  )
  (:goal
    (and
      (on orange_block red_block)
      (on red_block yellow_block)
      (on blue_block purple_block)
      (on purple_block green_block)
    )
  )
)