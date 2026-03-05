(define (problem blocksworld_stack6)
  (:domain blocksworld)
  (:objects
    purple blue green yellow red orange - block
    robot1 - robot
  )
  (:init
    ;; existing stack in the image: red (bottom) -> yellow -> green -> blue -> purple (top)
    (ontable red)
    (on yellow red)
    (on green yellow)
    (on blue green)
    (on purple blue)

    ;; orange block is alone on the table
    (ontable orange)

    ;; clear conditions
    (clear purple)
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (ontable orange)
      (on red orange)
      (on yellow red)
      (on green yellow)
      (on blue green)
      (on purple blue)
    )
  )
)