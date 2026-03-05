(define (problem bathroom_put_tp_in_cabinet2)
  (:domain put_task)

  (:objects
    robot - agent

    ;; receptacles / locations
    cabinet2_under_sink - receptacle
    trash_bin - receptacle

    ;; objects
    toilet_paper_roll1 - object
    empty_toilet_paper_roll - object
  )

  (:init
    ;; receptacle properties
    (openable cabinet2_under_sink)
    ;; cabinet door appears closed initially
    (not (opened cabinet2_under_sink))

    ;; initial object placements
    ;; toilet paper roll is on the counter; represented as not in any receptacle,
    ;; but co-located with the cabinet area for pickup purposes
    (atLocation robot cabinet2_under_sink)
    (atLocation robot toilet_paper_roll1)

    ;; empty roll is inside the trash bin
    (inReceptacle empty_toilet_paper_roll trash_bin)

    ;; agent starts holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle toilet_paper_roll1 cabinet2_under_sink)
      (inReceptacle empty_toilet_paper_roll cabinet2_under_sink)
    )
  )
)