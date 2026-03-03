(define (problem blocksworld_stacks_1)
  (:domain blocksworld)
  (:objects
    purple - block
    blue - block
    green - block
    red - block
    orange - block
    yellow - block
    robot1 - robot
  )
  (:init
    (handempty robot1)

    ;; Left stack (top to bottom): orange, yellow, blue
    (on orange yellow)
    (on yellow blue)
    (ontable blue)
    (clear orange)

    ;; Right stack (top to bottom): purple, red, green
    (on purple red)
    (on red green)
    (ontable green)
    (clear purple)
  )
  (:goal
    (and
      (on purple blue)
      (on blue green)
      (on green red)
      (on red orange)
      (on orange yellow)
      (ontable yellow)
      (clear purple)
    )
  )
)