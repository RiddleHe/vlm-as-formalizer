(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green orange yellow purple red - block
    robot1 - robot
  )
  (:init
    ;; stacks observed
    (on green orange)
    (ontable orange)
    (clear green)

    (on red yellow)
    (on yellow purple)
    (ontable purple)
    (clear red)

    ;; single block
    (ontable blue)
    (clear blue)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange yellow)
      (on yellow purple)
      (on purple red)
      (on red blue)
      (on blue green)
      (ontable green)
      (clear orange)
    )
  )
)