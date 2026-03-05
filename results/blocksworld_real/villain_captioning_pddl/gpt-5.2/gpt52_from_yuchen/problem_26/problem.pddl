(define (problem blocksworld_scene_3stacks)
  (:domain blocksworld)
  (:objects
    orange red yellow green blue purple - block
    robot1 - robot
  )
  (:init
    ;; initial tower (bottom to top): purple, blue, green, yellow, red, orange
    (ontable purple)
    (on blue purple)
    (on green blue)
    (on yellow green)
    (on red yellow)
    (on orange red)

    ;; clear status
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green blue)
      (on purple orange)
      (on red yellow)
    )
  )
)