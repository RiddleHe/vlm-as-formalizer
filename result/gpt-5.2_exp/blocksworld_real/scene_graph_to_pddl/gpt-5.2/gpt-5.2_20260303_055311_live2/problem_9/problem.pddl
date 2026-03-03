(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange-block-bottom purple-block-middle red-block-top
    green-block-bottom-right yellow-block-middle-right blue-block-top-right
    robot-arm - robot
  )
  (:init
    ;; table placements
    (ontable orange-block-bottom)
    (ontable green-block-bottom-right)

    ;; current stacks
    (on purple-block-middle orange-block-bottom)
    (on red-block-top purple-block-middle)
    (on yellow-block-middle-right green-block-bottom-right)
    (on blue-block-top-right yellow-block-middle-right)

    ;; clear blocks
    (clear red-block-top)
    (clear blue-block-top-right)

    ;; robot state
    (handempty robot-arm)
  )
  (:goal
    (and
      (on orange-block-bottom blue-block-top-right)
      (on red-block-top green-block-bottom-right)
      (on yellow-block-middle-right purple-block-middle)
    )
  )
)