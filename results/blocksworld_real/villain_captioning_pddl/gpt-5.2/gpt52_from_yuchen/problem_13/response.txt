(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    blue purple yellow orange red green - block
    robot1 - robot
  )
  (:init
    ;; stack A
    (on blue purple)
    (on purple yellow)
    (ontable yellow)

    ;; stack B
    (on green red)
    (on red orange)
    (ontable orange)

    ;; clear blocks
    (clear blue)
    (clear green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: blue over yellow
      (on blue yellow)
      (ontable yellow)

      ;; stack 2: orange over red over purple over green
      (ontable green)
      (on purple green)
      (on red purple)
      (on orange red)
    )
  )
)