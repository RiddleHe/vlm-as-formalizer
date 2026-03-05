(define (problem bathroom_put_spray_on_toilet)
  (:domain put_task)
  (:objects
    robot - agent

    bathroom_sink - sink
    toilet - receptacle

    spray_bottle - object
    toilet_paper_roll - object
    pencil_item - object
    cloth_rag - object
    bar_soap - object
    cardboard_tube - object
  )

  (:init
    ;; Receptacle properties
    ;; (No openable/opened facts given/visible)

    ;; Robot initially not at any object's location and holding nothing
    (not (holdsAny robot))

    ;; Object locations (modeled via atLocation to allow PickupObject)
    (atLocation robot spray_bottle) ; robot will need to navigate; actual start is "nowhere" (no atLocation facts required)
    (atLocation robot bathroom_sink)
    (atLocation robot toilet)
    (atLocation robot toilet_paper_roll)
    (atLocation robot pencil_item)
    (atLocation robot cloth_rag)
    (atLocation robot bar_soap)
    (atLocation robot cardboard_tube)

    ;; Scene placement: objects are on the countertop; not inside sink (no inReceptacle relations asserted)
    ;; Toilet exists as target surface/receptacle; spray bottle is not yet on/in it.
  )

  (:goal
    (and
      (inReceptacle spray_bottle toilet)
    )
  )
)