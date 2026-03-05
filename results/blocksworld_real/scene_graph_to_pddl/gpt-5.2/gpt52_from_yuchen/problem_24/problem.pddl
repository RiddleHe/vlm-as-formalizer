(define (problem blocksworld_scene_1)
  (:domain blocksworld)

  (:objects
    purple_block_top - block
    blue_block_middle - block
    orange_block_single - block
    green_block_bottom - block
    red_block_bottom_rightstack - block
    yellow_block_top_rightstack - block
    robot_arm - robot
  )

  (:init
    ;; stack in center
    (on purple_block_top blue_block_middle)
    (on blue_block_middle green_block_bottom)
    (ontable green_block_bottom)

    ;; single block
    (ontable orange_block_single)

    ;; stack on right
    (on yellow_block_top_rightstack red_block_bottom_rightstack)
    (ontable red_block_bottom_rightstack)

    ;; clear blocks
    (clear purple_block_top)
    (clear orange_block_single)
    (clear yellow_block_top_rightstack)

    ;; robot state
    (handempty robot_arm)
  )

  (:goal
    (and
      (on blue_block_middle orange_block_single)
      (on orange_block_single green_block_bottom)
      (on green_block_bottom purple_block_top)
      (on purple_block_top red_block_bottom_rightstack)
      (on red_block_bottom_rightstack yellow_block_top_rightstack)
    )
  )
)