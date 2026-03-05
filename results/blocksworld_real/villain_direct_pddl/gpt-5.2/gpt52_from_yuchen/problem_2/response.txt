(define (problem blocks-scene-1)
  (:domain blocksworld)
  (:objects
    orange blue purple red green yellow - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Current stacks from the image:
    ;; Left stack (bottom to top): red, purple, blue, orange
    (ontable red)
    (on purple red)
    (on blue purple)
    (on orange blue)
    (clear orange)

    ;; Right stack (bottom to top): yellow, green
    (ontable yellow)
    (on green yellow)
    (clear green)
  )
  (:goal
    (and
      (ontable yellow)
      (on orange yellow)
      (on blue orange)
      (on purple blue)
      (on red purple)
      (on green red)
      (clear green)
    )
  )
)