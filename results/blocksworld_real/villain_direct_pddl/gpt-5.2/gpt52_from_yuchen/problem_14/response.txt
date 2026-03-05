(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple yellow orange blue red green - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack 1 in the scene: orange on red on green (green on table)
    (on orange red)
    (on red green)
    (ontable green)
    (clear orange)

    ;; stack 2 in the scene: purple on yellow on blue (blue on table)
    (on purple yellow)
    (on yellow blue)
    (ontable blue)
    (clear purple)
  )
  (:goal
    (and
      ;; goal stack A: purple over yellow over orange (orange on table)
      (on purple yellow)
      (on yellow orange)
      (ontable orange)
      (clear purple)

      ;; goal stack B: blue over red over green (green on table)
      (on blue red)
      (on red green)
      (ontable green)
      (clear blue)

      (handempty robot1)
    )
  )
)