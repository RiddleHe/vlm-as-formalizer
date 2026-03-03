(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red green yellow purple blue orange - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; block positions from the image: red is on blue; others are on the table and clear
    (on red blue)
    (ontable blue)

    (ontable green)
    (ontable yellow)
    (ontable purple)
    (ontable orange)

    ;; clear conditions
    (clear red)
    (clear green)
    (clear yellow)
    (clear purple)
    (clear orange)
  )
  (:goal
    (and
      (on red green)
      (on yellow purple)
      (on blue orange)
    )
  )
)