(define (problem put_task_lamp_on_examine_bat)
  (:domain put_task)
  (:objects
    robot_agent - agent

    microwave - microwave
    fridge - fridge
    sink - sink

    wooden_desk_right - receptacle
    wooden_nightstand_left - receptacle
    bed_left - receptacle

    beige_lamp_on_desk - object
    black_trash_bag_in_corner - object
    wooden_baseball_bat_in_corner - object
    keys_with_orange_keychain_on_desk - object
    white_mug_on_desk - object
    round_alarm_clock_on_nightstand - object
    book_on_bed - object
  )

  (:init
    ;; receptacle contents
    (inReceptacle beige_lamp_on_desk wooden_desk_right)
    (inReceptacle keys_with_orange_keychain_on_desk wooden_desk_right)
    (inReceptacle white_mug_on_desk wooden_desk_right)
    (inReceptacle round_alarm_clock_on_nightstand wooden_nightstand_left)
    (inReceptacle book_on_bed bed_left)

    ;; robot initially not at any object's location and holding nothing
    (not (holdsAny robot_agent))
  )

  (:goal
    (and
      (isOn beige_lamp_on_desk)
    )
  )
)