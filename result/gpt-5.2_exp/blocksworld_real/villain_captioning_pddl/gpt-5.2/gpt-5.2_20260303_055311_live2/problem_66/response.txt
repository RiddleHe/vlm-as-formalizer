(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    blue yellow red green orange purple - block
    robot1 - robot
  )
  (:init
    ;; left stack
    (ontable blue)
    (on yellow blue)
    (on red yellow)
    (on green red)
    (clear green)

    ;; right stack
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