(define (problem blocksworld_scene_3stacks)
  (:domain blocksworld)

  (:objects
    yellow green red orange purple blue - block
    robot1 - robot
  )

  (:init
    ;; stack from bottom to top: blue, purple, orange, red, green, yellow
    (ontable blue)
    (on purple blue)
    (on orange purple)
    (on red orange)
    (on green red)
    (on yellow green)

    ;; clear status
    (clear yellow)

    ;; robot state
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