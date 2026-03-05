(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    red green blue purple yellow orange - block
    robot1 - robot
  )
  (:init
    ;; tower relationships
    (on yellow purple)
    (on purple blue)
    (on blue green)
    (on green red)

    ;; table placements
    (ontable red)
    (ontable orange)

    ;; clear blocks
    (clear yellow)
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green red)
      (on purple yellow)
      (on blue orange)
    )
  )
)