(define (problem put_task_spatulas_in_drawer)
  (:domain put_task)
  (:objects
    robot_agent - agent

    microwave - microwave
    fridge - fridge
    sink - sink
    white_counter_drawer_unit - receptacle

    wooden_spatula_upright_center - object
    wooden_spatula_flat_right_counter - object

    left_bread_loaf_on_counter - object
    right_bread_loaf_on_counter - object
    black_pan_on_left_counter - object
    scattered_photos_left - object
    scattered_photos_right - object
    black_tongs_left_counter - object
  )

  (:init
    (openable white_counter_drawer_unit)
    ;; robot initially not at any object's location; no (atLocation ...) facts
    ;; nothing is initially held; no (holdsAny ...) and no (holds ...) facts
    ;; no objects are initially specified as in any receptacle
  )

  (:goal
    (and
      (inReceptacle wooden_spatula_upright_center white_counter_drawer_unit)
      (inReceptacle wooden_spatula_flat_right_counter white_counter_drawer_unit)
    )
  )
)