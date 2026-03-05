(define (problem put_frying_pan_with_fork_on_round_table)
  (:domain put_task)

  (:objects
    agent1 - agent

    round_table - receptacle
    kitchen_counter - receptacle

    frying_pan - receptacle
    fork - object

    paper_towel_roll - object
    green_veg1 - object
    green_veg2 - object
    potato - object
    bottle - object
    green_box - object
    egg - object
    loaf - object
    spatula - object

    knife1 - knife
  )

  (:init
    ;; agent starts not at any object's location (no atLocation facts for agent1)

    ;; receptacles/surfaces in the scene
    ;; (round_table and kitchen_counter are receptacles by type)

    ;; objects on/in the round table (modeled with inReceptacle)
    (inReceptacle fork round_table)
    (inReceptacle paper_towel_roll round_table)
    (inReceptacle green_veg1 round_table)
    (inReceptacle green_veg2 round_table)
    (inReceptacle potato round_table)
    (inReceptacle bottle round_table)
    (inReceptacle green_box round_table)
    (inReceptacle egg round_table)
    (inReceptacle knife1 round_table)

    ;; objects on/in the kitchen counter
    (inReceptacle loaf kitchen_counter)
    (inReceptacle spatula kitchen_counter)

    ;; frying pan is not visible in the provided view; include it as an object in the scene,
    ;; initially on the kitchen counter (a plausible starting location distinct from the goal).
    (inReceptacle frying_pan kitchen_counter)
  )

  (:goal
    (and
      ;; frying pan is on the round table
      (inReceptacle frying_pan round_table)
      ;; fork is in the frying pan
      (inReceptacle fork frying_pan)
    )
  )
)