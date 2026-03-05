(define (problem put_task_remote_on_sofa)
  (:domain put_task)
  (:objects
    robot_agent - agent

    black_leather_three_seat_sofa_left - receptacle
    black_coffee_table_center - receptacle
    open_cardboard_box_on_table - receptacle

    gray_tv_remote_on_table - object
    small_gray_elephant_toy_on_table - object
    scattered_photos_and_papers_on_table - object
  )

  (:init
    (atLocation robot_agent black_leather_three_seat_sofa_left)

    (inReceptacle gray_tv_remote_on_table black_coffee_table_center)
    (inReceptacle small_gray_elephant_toy_on_table black_coffee_table_center)
    (inReceptacle scattered_photos_and_papers_on_table black_coffee_table_center)
    (inReceptacle open_cardboard_box_on_table black_coffee_table_center)
  )

  (:goal
    (and
      (inReceptacle gray_tv_remote_on_table black_leather_three_seat_sofa_left)
    )
  )
)