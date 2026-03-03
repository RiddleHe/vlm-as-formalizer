(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple blue red orange yellow green - block
    robot1 - robot
  )
  (:init
    ;; block positions from the image
    (ontable green)
    (ontable purple)
    (ontable orange)
    (on red orange)
    (ontable yellow)
    (on blue yellow)

    ;; clear conditions
    (clear green)
    (clear purple)
    (clear red)
    (clear blue)

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