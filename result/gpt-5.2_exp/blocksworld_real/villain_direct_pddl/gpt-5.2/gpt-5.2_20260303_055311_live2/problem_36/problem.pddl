(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red yellow blue orange green purple - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Current stacks seen in the image:
    ;; orange on yellow
    (on orange yellow)
    (clear orange)

    ;; blue on red
    (on blue red)
    (clear blue)

    ;; Blocks on the table
    (ontable yellow)
    (ontable red)
    (ontable green)
    (ontable purple)

    ;; Clear blocks (no block on top)
    (clear green)
    (clear purple)

    ;; Blocks that are not clear because something is on them
    ;; (yellow has orange on it; red has blue on it)
  )
  (:goal
    (and
      (on red yellow)
      (on yellow blue)
      (ontable blue)
      (clear red)

      (on orange green)
      (on green purple)
      (ontable purple)
      (clear orange)
    )
  )
)