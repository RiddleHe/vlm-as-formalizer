(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    orange blue yellow purple red green - block
    robot1 - robot
  )
  (:init
    ;; left stack
    (on orange blue)
    (ontable blue)
    (clear orange)

    ;; right stack
    (on yellow purple)
    (ontable purple)
    (clear yellow)

    ;; single blocks
    (ontable red)
    (clear red)
    (ontable green)
    (clear green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: orange over blue over yellow
      (on orange blue)
      (on blue yellow)

      ;; stack 2: purple over red over green
      (on purple red)
      (on red green)
    )
  )
)