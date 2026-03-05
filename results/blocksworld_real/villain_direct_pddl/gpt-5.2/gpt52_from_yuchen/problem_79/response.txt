(define (problem blocks-task)
  (:domain blocksworld)
  (:objects
    blue purple yellow green red orange - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; block positions from the image
    (ontable purple)
    (ontable yellow)
    (ontable blue)
    (ontable orange)
    (on red orange)
    (on green red)

    ;; clear conditions
    (clear purple)
    (clear yellow)
    (clear blue)
    (clear green)
  )
  (:goal
    (and
      (on blue orange)
      (on purple green)
      (on yellow red)
    )
  )
)