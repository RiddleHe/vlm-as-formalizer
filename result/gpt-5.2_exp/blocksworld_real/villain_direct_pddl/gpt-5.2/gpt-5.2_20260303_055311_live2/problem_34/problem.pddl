(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple yellow green red blue orange - block
    robot1 - robot
  )
  (:init
    ;; initial tower from bottom to top: blue, purple, orange, red, green, yellow
    (ontable blue)
    (on purple blue)
    (on orange purple)
    (on red orange)
    (on green red)
    (on yellow green)

    (clear yellow)

    (handempty robot1)
  )
  (:goal
    (and
      (on purple yellow)
      (on green red)
      (on blue orange)
    )
  )
)