(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange_cube yellow_cube green_cube blue_cube red_cube purple_cube - block
    single_robot_arm - robot
  )
  (:init
    ;; blocks on table
    (ontable orange_cube)
    (ontable yellow_cube)
    (ontable red_cube)

    ;; stacked relations
    (on green_cube yellow_cube)
    (on blue_cube green_cube)
    (on purple_cube red_cube)

    ;; clear blocks
    (clear orange_cube)
    (clear blue_cube)
    (clear purple_cube)

    ;; robot state
    (handempty single_robot_arm)
  )
  (:goal
    (and
      (on yellow_cube blue_cube)
      (on red_cube orange_cube)
      (on orange_cube green_cube)
      (on green_cube purple_cube)
    )
  )
)