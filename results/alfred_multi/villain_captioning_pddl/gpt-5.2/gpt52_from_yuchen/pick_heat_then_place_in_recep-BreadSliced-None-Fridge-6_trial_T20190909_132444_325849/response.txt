(define (problem cook_chill_bread_slice)
  (:domain put_task)
  (:objects
    robot - agent

    microwave1 - microwave
    fridge1 - fridge

    knife1 - knife
    bread1 - object
    saltshaker1 - object
    greenproduce1 - object
    greenproduce2 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)
    ;; both appear closed initially (so no (opened ...) facts)

    ;; robot initially not at any object's location and holds nothing
    (not (holdsAny robot))

    ;; object locations (on counters / at their own locations)
    (atLocation robot bread1)
    (atLocation robot knife1)
    (atLocation robot saltshaker1)
    (atLocation robot greenproduce1)
    (atLocation robot greenproduce2)

    ;; microwave and fridge are separate locations
    ;; (robot is not initially at these locations)

    ;; no objects are inside receptacles initially (no inReceptacle facts)

    ;; bread is not sliced/hot/cool initially (omit predicates)
  )

  (:goal
    (and
      (isSliced bread1)
      (isHot bread1)
      (isCool bread1)
    )
  )
)