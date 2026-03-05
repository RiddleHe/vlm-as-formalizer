(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange red yellow purple green blue - block
    robot1 - robot
  )
  (:init
    ;; stacks in the scene
    (on orange red)
    (on yellow purple)
    (on green blue)

    ;; blocks on the table
    (ontable red)
    (ontable purple)
    (ontable blue)

    ;; clear blocks (tops of stacks)
    (clear orange)
    (clear yellow)
    (clear green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow orange)
      (on red green)
      (on blue purple)
    )
  )
)