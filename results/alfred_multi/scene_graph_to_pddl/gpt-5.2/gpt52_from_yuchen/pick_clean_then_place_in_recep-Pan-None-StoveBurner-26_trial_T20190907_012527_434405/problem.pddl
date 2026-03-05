(define (problem rinse_pan_problem)
  (:domain put_task)
  (:objects
    robot - agent
    microwave_left_counter - microwave
    sink_right_counter - sink
    dirty_square_pan_on_stove - object
    egg_on_counter_edge - object
  )
  (:init
    (openable microwave_left_counter)
  )
  (:goal
    (and
      (isClean dirty_square_pan_on_stove)
    )
  )
)