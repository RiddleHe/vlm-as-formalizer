(define (problem blocksworld_scene)
  (:domain blocksworld)

  (:objects
    blue yellow red green orange purple - block
    robot1 - robot
  )

  (:init
    ;; left stack in the scene: green on red on yellow on blue (blue on table)
    (ontable blue)
    (on yellow blue)
    (on red yellow)
    (on green red)
    (clear green)

    ;; right stack in the scene: purple on orange (orange on table)
    (ontable orange)
    (on purple orange)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )

  (:goal
    (and
      ;; stack 1: orange over green
      (on orange green)

      ;; stack 2: red over blue over purple over yellow
      (on red blue)
      (on blue purple)
      (on purple yellow)
    )
  )
)