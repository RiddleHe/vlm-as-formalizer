(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    red blue yellow orange green purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack: orange on yellow
    (on orange yellow)
    (ontable yellow)
    (clear orange)

    ;; stack: blue on red
    (on blue red)
    (ontable red)
    (clear blue)

    ;; single blocks
    (ontable green)
    (clear green)
    (ontable purple)
    (clear purple)
  )
  (:goal
    (and
      ;; stack 1: red over yellow over blue
      (on red yellow)
      (on yellow blue)
      ;; stack 2: orange over green over purple
      (on orange green)
      (on green purple)
    )
  )
)