(define (problem put_warm_coffee_cup_into_coffee_maker)
  (:domain put_task)

  (:objects
    robot - agent
    red-countertop-microwave - microwave
    beige-coffee-maker-with-drip-tray - receptacle
    coffee-maker-drip-tray - object
    microwave-glass-turntable - object
    metal-spoon-on-counter - object
    metal-fork-on-counter - object
    round-brown-item-on-counter - object
  )

  (:init
    (openable red-countertop-microwave)
    (inReceptacle microwave-glass-turntable red-countertop-microwave)
    (inReceptacle coffee-maker-drip-tray beige-coffee-maker-with-drip-tray)
  )

  (:goal
    (and
      (isHot round-brown-item-on-counter)
      (inReceptacle round-brown-item-on-counter beige-coffee-maker-with-drip-tray)
    )
  )
)