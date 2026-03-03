(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    orange_block - block
    green_block - block
    blue_block - block
    yellow_block - block
    red_block - block
    purple_block - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; observed block placements
    (ontable orange_block)
    (ontable green_block)
    (ontable purple_block)
    (ontable red_block)
    (ontable blue_block)
    (on yellow_block blue_block)

    ;; clear conditions (no block on top)
    (clear orange_block)
    (clear green_block)
    (clear purple_block)
    (clear red_block)
    (clear yellow_block)
  )
  (:goal
    (and
      (on blue_block green_block)
      (on green_block red_block)
      (on red_block yellow_block)
      (on yellow_block orange_block)
      (on orange_block purple_block)
    )
  )
)