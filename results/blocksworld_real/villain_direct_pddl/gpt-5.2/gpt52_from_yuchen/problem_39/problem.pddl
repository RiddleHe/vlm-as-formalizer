(define (problem blocks_scene_1)
  (:domain blocksworld)
  (:objects
    orange blue yellow purple red green - block
    robot1 - robot
  )
  (:init
    ;; stacks in the scene
    (on orange blue)
    (ontable blue)
    (clear orange)

    (on yellow purple)
    (ontable purple)
    (clear yellow)

    ;; single blocks on table
    (ontable red)
    (clear red)

    (ontable green)
    (clear green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange blue)
      (on blue yellow)
      (ontable yellow)
      (clear orange)

      (on purple red)
      (on red green)
      (ontable green)
      (clear purple)
    )
  )
)