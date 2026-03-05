(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    purple - block
    green - block
    red - block
    orange - block
    blue - block
    yellow - block
    robot1 - robot
  )
  (:init
    ;; stacks seen in the image
    (on red orange)
    (on blue yellow)

    ;; blocks on table
    (ontable orange)
    (ontable yellow)
    (ontable purple)
    (ontable green)

    ;; clear blocks (nothing on top)
    (clear red)
    (clear blue)
    (clear purple)
    (clear green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on purple blue)
      (on red orange)
      (on yellow green)
    )
  )
)