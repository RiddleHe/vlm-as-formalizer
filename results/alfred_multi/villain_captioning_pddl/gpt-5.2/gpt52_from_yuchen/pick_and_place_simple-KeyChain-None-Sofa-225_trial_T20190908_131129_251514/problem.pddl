(define (problem move_keys_to_loveseat)
  (:domain put_task)

  (:objects
    robot - agent

    loveseat - receptacle
    side_table - receptacle
    cardboard_box - receptacle

    keys - object
    lamp - object
    laptop - object
    remote1 - object
    remote2 - object
    orange_item - object
    chair - object
  )

  (:init
    ;; agent initial condition
    (not (holdsAny robot))

    ;; receptacle relations (what is in/on what)
    (inReceptacle keys side_table)
    (inReceptacle lamp side_table)

    (inReceptacle cardboard_box loveseat)
    (inReceptacle laptop loveseat)
    (inReceptacle remote1 loveseat)
    (inReceptacle orange_item loveseat)
    (inReceptacle remote2 loveseat)

    ;; open/close info (box appears open, but only tracked for openable receptacles)
    ;; leaving (openable ...) and (opened ...) unspecified since not required for this task
  )

  (:goal
    (and
      (inReceptacle keys loveseat)
    )
  )
)