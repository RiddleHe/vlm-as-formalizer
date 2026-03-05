(define (problem blocksworld_scene_3stacks)
  (:domain blocksworld)
  (:objects
    purple green yellow blue orange red - block
    robot1 - robot
  )
  (:init
    ;; current tower (top to bottom): purple -> green -> yellow -> blue -> orange -> red
    (on purple green)
    (on green yellow)
    (on yellow blue)
    (on blue orange)
    (on orange red)

    (ontable red)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      (on yellow orange)
      (on purple green)
      (on red blue)
    )
  )
)