(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow orange red green blue purple - block
    r1 - robot
  )
  (:init
    ;; robot state
    (handempty r1)

    ;; block positions from the image
    (ontable green)
    (ontable orange)
    (ontable yellow)
    (ontable red)
    (ontable blue)
    (on purple blue)

    ;; clear conditions
    (clear green)
    (clear orange)
    (clear yellow)
    (clear red)
    (clear purple)
  )
  (:goal
    (and
      (on yellow orange)
      (on blue red)
      (on green purple)
    )
  )
)