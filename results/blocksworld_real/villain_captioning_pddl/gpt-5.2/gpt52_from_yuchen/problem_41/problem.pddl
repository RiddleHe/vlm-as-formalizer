(define (problem blocksworld_scene_3stacks)
  (:domain blocksworld)
  (:objects
    yellow red green purple orange blue - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; tall stack: purple on green on red on yellow (yellow on table)
    (ontable yellow)
    (on red yellow)
    (on green red)
    (on purple green)
    (clear purple)

    ;; short stack: orange on blue (blue on table)
    (ontable blue)
    (on orange blue)
    (clear orange)
  )
  (:goal
    (and
      (on orange purple)
      (on green blue)
      (on yellow red)
    )
  )
)