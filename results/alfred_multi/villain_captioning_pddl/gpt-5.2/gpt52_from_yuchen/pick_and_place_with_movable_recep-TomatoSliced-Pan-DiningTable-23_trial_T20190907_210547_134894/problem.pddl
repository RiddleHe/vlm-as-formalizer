(define (problem put_task_pan_tomato_slice_on_island)
  (:domain put_task)

  (:objects
    robot - agent

    island - receptacle
    stove - receptacle

    pan - receptacle
    knife - knife
    tomato - object
  )

  (:init
    ;; receptacle properties
    ;; (no openable/opened objects visible/needed)

    ;; initial placements (from scene)
    (inReceptacle pan stove)
    (inReceptacle knife island)
    (inReceptacle tomato island)

    ;; robot initially not at any object's location and holds nothing
    ;; (so no atLocation facts initially)
    ;; (so no holds / holdsAny facts initially)
  )

  (:goal
    (and
      (inReceptacle pan island)
      (inReceptacle tomato pan)
      (isSliced tomato)
    )
  )
)