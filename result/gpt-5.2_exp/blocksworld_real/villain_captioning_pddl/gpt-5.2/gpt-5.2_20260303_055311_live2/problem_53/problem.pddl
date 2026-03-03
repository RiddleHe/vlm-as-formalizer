(define (problem blocksworld_scene1)
  (:domain blocksworld)

  (:objects
    blue orange yellow green red purple - block
    robot1 - robot
  )

  (:init
    ;; stacks in the scene
    (on blue orange)
    (ontable orange)
    (clear blue)

    (on yellow green)
    (ontable green)
    (clear yellow)

    (on red purple)
    (ontable purple)
    (clear red)

    ;; robot state
    (handempty robot1)
  )

  (:goal
    (and
      (on orange yellow)
      (on green blue)
      (on purple red)
    )
  )
)