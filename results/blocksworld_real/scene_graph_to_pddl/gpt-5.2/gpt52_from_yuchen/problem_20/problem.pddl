(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    blue_cube green_cube red_cube orange_cube yellow_cube purple_cube - block
    robot_arm - robot
  )
  (:init
    (ontable blue_cube)
    (ontable green_cube)
    (ontable red_cube)
    (ontable orange_cube)
    (ontable yellow_cube)
    (ontable purple_cube)

    (clear blue_cube)
    (clear green_cube)
    (clear red_cube)
    (clear orange_cube)
    (clear yellow_cube)
    (clear purple_cube)

    (on purple_cube orange_cube)
    (on orange_cube yellow_cube)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_cube orange_cube)
      (on orange_cube red_cube)
      (on red_cube purple_cube)
      (on blue_cube green_cube)
    )
  )
)