(define (problem move_credit_card_to_armchair)
  (:domain put_task)
  (:objects
    robot_agent - agent
    dark_blue_leather_armchair - receptacle
    small_white_credit_card_like_card - object
    dark_wood_side_table_with_white_items - object
  )
  (:init
    ;; No initial (atLocation ...) facts: robot starts not at any object's location
  )
  (:goal
    (and
      (inReceptacle small_white_credit_card_like_card dark_blue_leather_armchair)
    )
  )
)