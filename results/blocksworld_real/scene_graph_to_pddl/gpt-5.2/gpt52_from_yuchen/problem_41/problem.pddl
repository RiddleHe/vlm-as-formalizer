(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange-block-top-left-stack - block
    blue-block-bottom-left-stack - block
    purple-block-top-right-stack - block
    green-block-second-right-stack - block
    red-block-third-right-stack - block
    yellow-block-bottom-right-stack - block
    robot-arm - robot
  )
  (:init
    ;; robot state
    (handempty robot-arm)

    ;; table placements
    (ontable blue-block-bottom-left-stack)
    (ontable yellow-block-bottom-right-stack)

    ;; stacks in the scene
    (on orange-block-top-left-stack blue-block-bottom-left-stack)
    (on red-block-third-right-stack yellow-block-bottom-right-stack)
    (on green-block-second-right-stack red-block-third-right-stack)
    (on purple-block-top-right-stack green-block-second-right-stack)

    ;; clear blocks
    (clear orange-block-top-left-stack)
    (clear purple-block-top-right-stack)
  )
  (:goal
    (and
      (on orange-block-top-left-stack purple-block-top-right-stack)
      (on green-block-second-right-stack blue-block-bottom-left-stack)
      (on yellow-block-bottom-right-stack red-block-third-right-stack)
    )
  )
)