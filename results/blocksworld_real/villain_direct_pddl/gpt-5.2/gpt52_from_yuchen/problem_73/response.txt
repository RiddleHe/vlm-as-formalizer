(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange red green yellow purple - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Scene from image:
    ;; Left stack: blue on orange, orange on table
    (on blue orange)
    (ontable orange)
    (clear blue)

    ;; Right stack: red on green on yellow, yellow on table
    (on red green)
    (on green yellow)
    (ontable yellow)
    (clear red)

    ;; Purple block on table
    (ontable purple)
    (clear purple)

    ;; Blocks that have something on them are not clear
    (not (clear orange))
    (not (clear green))
    (not (clear yellow))
  )
  (:goal
    (and
      ;; Stack 1: red over yellow over orange over blue (bottom to top: blue, orange, yellow, red)
      (on orange blue)
      (on yellow orange)
      (on red yellow)

      ;; Stack 2: green over purple
      (on green purple)
    )
  )
)