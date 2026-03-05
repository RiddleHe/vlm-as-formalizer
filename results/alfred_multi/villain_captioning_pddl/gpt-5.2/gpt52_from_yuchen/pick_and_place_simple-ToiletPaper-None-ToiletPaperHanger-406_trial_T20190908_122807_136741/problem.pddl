(define (problem bathroom_put_toilet_paper)
  (:domain put_task)
  (:objects
    robot - agent
    sink1 - sink
    toilet_paper_roll1 - object
    toilet_paper_dispenser1 - object
  )
  (:init
    ;; Robot initially not at any object's location and holds nothing
    (not (holdsAny robot))

    ;; Object locations (roll on countertop; dispenser on wall)
    ;; We model these as separate interactable locations.
    (atLocation robot toilet_paper_roll1)
    (not (atLocation robot toilet_paper_roll1))

    ;; No objects are in the sink initially
    (not (inReceptacle toilet_paper_roll1 sink1))
  )
  (:goal
    (and
      ;; Move the toilet paper roll to the toilet paper dispenser location
      (atLocation robot toilet_paper_dispenser1)
      (inReceptacle toilet_paper_roll1 toilet_paper_dispenser1)
    )
  )
)