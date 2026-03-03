(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple blue green yellow red orange - block
    robot1 - robot
  )
  (:init
    ;; From the image: a single vertical stack (bottom to top):
    ;; purple, blue, green, yellow, red, orange
    (ontable purple)
    (on blue purple)
    (on green blue)
    (on yellow green)
    (on red yellow)
    (on orange red)

    (clear orange)

    (handempty robot1)
  )
  (:goal
    (and
      (on green blue)
      (on purple orange)
      (on red yellow)
    )
  )
)