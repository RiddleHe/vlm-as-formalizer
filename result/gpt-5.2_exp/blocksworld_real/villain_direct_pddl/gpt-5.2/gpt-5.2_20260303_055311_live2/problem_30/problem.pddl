(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange purple green blue yellow red - block
    robot1 - robot
  )
  (:init
    ;; current stack observed (top to bottom): orange on red on yellow on purple on green on blue
    (on orange red)
    (on red yellow)
    (on yellow purple)
    (on purple green)
    (on green blue)
    (ontable blue)

    (clear orange)
    (handempty robot1)
  )
  (:goal
    (and
      (on orange purple)
      (on purple green)
      (on green blue)
      (on blue yellow)
      (on yellow red)
      (ontable red)
      (clear orange)
    )
  )
)