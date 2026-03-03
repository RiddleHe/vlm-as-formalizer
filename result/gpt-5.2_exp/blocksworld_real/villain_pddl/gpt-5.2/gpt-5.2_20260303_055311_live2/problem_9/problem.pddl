(define (problem blocksworld_scene1)
  (:domain blocksworld)

  (:objects
    robot1 - robot
    orange blue red green yellow purple - block
  )

  (:init
    ;; robot initial state
    (handempty robot1)

    ;; From the image: two stacks are present and standing on the table.
    ;; Left stack (bottom->top): orange, purple, red
    (ontable orange)
    (on purple orange)
    (on red purple)
    (clear red)

    ;; Right stack (bottom->top): green, yellow, blue
    (ontable green)
    (on yellow green)
    (on blue yellow)
    (clear blue)
  )

  (:goal
    (and
      ;; Create 3 stacks: orange over blue, red over green, yellow over purple
      (on orange blue)
      (on red green)
      (on yellow purple)
    )
  )
)