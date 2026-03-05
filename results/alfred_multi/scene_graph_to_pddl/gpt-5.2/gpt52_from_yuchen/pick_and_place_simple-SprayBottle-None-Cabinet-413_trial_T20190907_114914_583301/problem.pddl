(define (problem put_spray_bottle_in_cabinet_bathroom)
  (:domain put_task)
  (:objects
    agent0 - agent

    bathroom_vanity_cabinet_under_sinks - receptacle
    red_trash_bin_next_to_toilet - receptacle

    green_spray_bottle_on_toilet_tank - object
    toilet - object
    toilet_paper_roll_on_holder - object
  )

  (:init
    (openable bathroom_vanity_cabinet_under_sinks)

    (inReceptacle toilet_paper_roll_on_holder bathroom_vanity_cabinet_under_sinks)
    (inReceptacle green_spray_bottle_on_toilet_tank toilet)
    (inReceptacle red_trash_bin_next_to_toilet toilet)
  )

  (:goal
    (and
      (inReceptacle green_spray_bottle_on_toilet_tank bathroom_vanity_cabinet_under_sinks)
    )
  )
)