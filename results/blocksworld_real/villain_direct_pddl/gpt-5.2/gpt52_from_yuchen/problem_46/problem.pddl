(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    red yellow orange purple blue green - block
    robot1 - robot
  )
  (:init
    ;; stack in the image (top to bottom): red, yellow, orange, purple, blue, green
    (on red yellow)
    (on yellow orange)
    (on orange purple)
    (on purple blue)
    (on blue green)
    (ontable green)

    (clear red)
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow green)
      (on blue purple)
      (on orange red)
    )
  )
)