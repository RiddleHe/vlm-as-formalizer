(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue purple orange red yellow - block
    robot1 - robot
  )
  (:init
    ;; From the image: a single vertical stack (bottom to top):
    ;; purple on blue on green on yellow on red on orange
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
      ;; Create 3 stacks:
      (on green blue)
      (on purple orange)
      (on red yellow)
    )
  )
)