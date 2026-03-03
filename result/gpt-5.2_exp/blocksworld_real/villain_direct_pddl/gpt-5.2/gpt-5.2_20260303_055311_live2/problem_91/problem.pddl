(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue purple yellow orange red - block
    robot1 - robot
  )
  (:init
    ;; stack 1: green on blue, blue on table
    (on green blue)
    (ontable blue)
    (clear green)

    ;; single blocks on table
    (ontable purple)
    (clear purple)

    ;; stack 2: yellow on orange, orange on table
    (on yellow orange)
    (ontable orange)
    (clear yellow)

    ;; red block on table
    (ontable red)
    (clear red)

    ;; robot initial state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange purple)
      (on purple red)
      (on red yellow)
      (on yellow green)
      (on green blue)
    )
  )
)