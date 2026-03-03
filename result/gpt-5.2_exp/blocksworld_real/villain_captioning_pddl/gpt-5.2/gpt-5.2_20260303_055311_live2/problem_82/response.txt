(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    blue yellow red orange green purple - block
    robot1 - robot
  )
  (:init
    ;; stack of 5 (bottom to top): green, orange, red, yellow, blue
    (ontable green)
    (on orange green)
    (on red orange)
    (on yellow red)
    (on blue yellow)

    ;; single block on table
    (ontable purple)

    ;; clear conditions
    (clear blue)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: red over blue
      (on red blue)

      ;; stack 2: yellow over green over orange over purple
      (on green orange)
      (on orange purple)
      (on yellow green)
    )
  )
)