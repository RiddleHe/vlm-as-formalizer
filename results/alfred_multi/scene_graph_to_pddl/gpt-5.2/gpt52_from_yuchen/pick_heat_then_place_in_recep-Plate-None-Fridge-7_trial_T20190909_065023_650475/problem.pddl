(define (problem put_task_problem_1)
  (:domain put_task)

  (:objects
    robot - agent
    microwave_red_trim_silver_body_on_upper_cabinet - microwave
    fridge_large_dark_grey_front - fridge
    upper_cabinet_left_double_door_wood - receptacle
    upper_cabinet_right_single_door_wood - receptacle
  )

  (:init
    (openable upper_cabinet_left_double_door_wood)
    (openable upper_cabinet_right_single_door_wood)
    (openable microwave_red_trim_silver_body_on_upper_cabinet)
    (openable fridge_large_dark_grey_front)
  )

  ;; Note: The scene graph does not contain any "grey plate" object, so it cannot be
  ;; included in the problem while satisfying the constraint that all objects must
  ;; exist in the scene graph.
  (:goal
    (and
      ;; Intended goal (not expressible without a plate object in the scene graph):
      ;; (inReceptacle grey_plate fridge_large_dark_grey_front)
      ;; (isHot grey_plate)
    )
  )
)