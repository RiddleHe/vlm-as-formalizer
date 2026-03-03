(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    yellow red orange purple green blue - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; on relations (stacks)
    (on yellow red)
    (on red orange)
    (on purple green)

    ;; on-table blocks
    (ontable orange)
    (ontable green)
    (ontable blue)

    ;; clear blocks (nothing on top)
    (clear yellow)
    (clear purple)
    (clear blue)
  )
  (:goal
    (and
      (on purple green)
      (on yellow red)
      (on orange blue)
    )
  )
)