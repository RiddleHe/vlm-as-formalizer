(define (problem blocksworld_color_stack_1)
  (:domain blocksworld)
  (:objects
    green blue yellow red purple orange - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; current scene (from image)
    (ontable green)
    (ontable blue)
    (ontable orange)

    (ontable yellow)
    (on red yellow)
    (on purple red)

    (clear green)
    (clear blue)
    (clear orange)
    (clear purple)
  )
  (:goal
    (and
      (ontable green)
      (on yellow green)
      (on blue yellow)
      (on red blue)
      (on purple red)
      (on orange purple)
      (clear orange)
    )
  )
)