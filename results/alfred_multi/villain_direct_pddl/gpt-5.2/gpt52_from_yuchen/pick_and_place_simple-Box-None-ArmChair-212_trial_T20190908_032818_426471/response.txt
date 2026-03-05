(define (problem put_cardboard_box_on_green_chair)
  (:domain put_task)
  (:objects
    robot - agent
    green_chair - receptacle
    cardboard_box - object
  )
  (:init
    ;; receptacle properties
    ;; (green_chair is a receptacle that can hold the box)
    
    ;; initial object placements
    (inReceptacle cardboard_box green_chair)

    ;; robot starts not at any object's location (so no atLocation facts)
  )
  (:goal
    (and
      (inReceptacle cardboard_box green_chair)
    )
  )
)