(define (problem blocksworld_scene_stack1)
  (:domain blocksworld)

  (:objects
    yellow orange green purple red blue - block
    robot1 - robot
  )

  (:init
    ;; Robot state
    (handempty robot1)

    ;; Stack 1: yellow on orange (orange on table)
    (on yellow orange)
    (ontable orange)
    (clear yellow)

    ;; Stack 2: red on green on purple (purple on table)
    (on red green)
    (on green purple)
    (ontable purple)
    (clear red)

    ;; Single block: blue on table
    (ontable blue)
    (clear blue)
  )

  (:goal
    (and
      (on yellow green)
      (on green purple)
      (on purple red)
      (on red blue)
      (on blue orange)
      (ontable orange)
    )
  )
)