(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow red orange purple green blue - block
    robot1 - robot
  )
  (:init
    ;; left stack: yellow on red on orange (orange on table)
    (on yellow red)
    (on red orange)
    (ontable orange)
    (clear yellow)

    ;; middle stack: purple on green (green on table)
    (on purple green)
    (ontable green)
    (clear purple)

    ;; single block on table
    (ontable blue)
    (clear blue)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on purple green)
      (on yellow red)
      (on orange blue)
    )
  )
)