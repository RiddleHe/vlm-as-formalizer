(define (problem blocksworld_scene_stacks3)
  (:domain blocksworld)
  (:objects
    red yellow orange purple blue green - block
    robot1 - robot
  )
  (:init
    ;; stack in scene
    (on red yellow)

    ;; on table
    (ontable yellow)
    (ontable orange)
    (ontable purple)
    (ontable blue)
    (ontable green)

    ;; clear blocks
    (clear red)
    (clear orange)
    (clear purple)
    (clear blue)
    (clear green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow purple)
      (on blue red)
      (on orange green)
    )
  )
)