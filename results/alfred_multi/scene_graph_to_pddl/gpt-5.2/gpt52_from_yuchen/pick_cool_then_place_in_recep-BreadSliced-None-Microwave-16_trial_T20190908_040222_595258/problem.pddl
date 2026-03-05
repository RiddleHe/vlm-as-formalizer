(define (problem put_task_cooled_bread_to_microwave)
  (:domain put_task)

  (:objects
    robot_agent - agent

    red_black_microwave_on_counter - microwave
    dark_fridge_with_letter_magnets - fridge

    two_dark_bread_loaves_on_table - object
  )

  (:init
    ;; receptacle properties from scene graph
    (openable red_black_microwave_on_counter)
    (openable dark_fridge_with_letter_magnets)

    ;; robot initially holds nothing and is not at any location (no atLocation facts)
  )

  (:goal
    (and
      (isCool two_dark_bread_loaves_on_table)
      (inReceptacle two_dark_bread_loaves_on_table red_black_microwave_on_counter)
    )
  )
)