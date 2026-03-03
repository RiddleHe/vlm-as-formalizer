(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green orange yellow purple red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; left stack: green on orange; both on table; green is clear
    (ontable orange)
    (on green orange)
    (clear green)

    ;; blue block on table and clear
    (ontable blue)
    (clear blue)

    ;; right stack: red on yellow on purple; purple on table; red is clear
    (ontable purple)
    (on yellow purple)
    (on red yellow)
    (clear red)
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