(define (problem put_task_pan_tomato_slice_on_island)
  (:domain put_task)
  (:objects
    robot - agent

    island - receptacle
    stove - receptacle
    pan - receptacle
    tomato - object
    knife - knife
  )

  (:init
    ;; robot initially not at any object's location (no atLocation facts)

    ;; receptacle properties
    ;; (no openable/opened objects needed for this task)

    ;; initial object placements inferred from the scene
    (inReceptacle pan stove)
    (atLocation robot stove)
    (atLocation robot pan)

    ;; tomato and knife are on/at the island area in the scene
    (atLocation robot island)
    (atLocation robot tomato)
    (atLocation robot knife)
  )

  (:goal
    (and
      (inReceptacle pan island)
      (isSliced tomato)
      (inReceptacle tomato pan)
    )
  )
)