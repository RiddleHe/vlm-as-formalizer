(define (problem cool-egg-then-put-in-microwave)
  (:domain put_task)
  (:objects
    robot - agent

    microwave1 - microwave
    fridge1 - fridge

    egg1 - object
  )

  (:init
    ;; receptacles that are openable (as typical appliances)
    (openable microwave1)
    (openable fridge1)

    ;; object locations (agent must go to objects/receptacles first)
    (atLocation robot egg1)

    ;; egg starts on the counter (not in any receptacle), so only its location is given
    ;; microwave and fridge exist as receptacles; no initial 'opened' state assumed
  )

  (:goal
    (and
      (isCool egg1)
      (inReceptacle egg1 microwave1)
    )
  )
)