(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue green orange yellow purple red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack A: green on orange (orange on table)
    (ontable orange)
    (on green orange)
    (clear green)

    ;; stack B: red on yellow on purple (purple on table)
    (ontable purple)
    (on yellow purple)
    (on red yellow)
    (clear red)

    ;; single block
    (ontable blue)
    (clear blue)
  )
  (:goal
    (and
      (on orange yellow)
      (on yellow purple)
      (on purple red)
      (on red blue)
      (on blue green)
    )
  )
)