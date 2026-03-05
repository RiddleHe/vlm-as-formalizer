(define (problem put_task_heated_potato_in_fridge)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge
    microwave1 - microwave
    sink1 - sink

    potato1 potato2 - object
  )

  (:init
    ;; receptacles are openable (per scene description)
    (openable fridge1)
    (openable microwave1)

    ;; both appear closed initially
    (not (opened fridge1))
    (not (opened microwave1))

    ;; object locations (both potatoes are on/at the table area; modeled as at their own locations)
    (atLocation robot potato1)
    (atLocation robot potato2)

    ;; no object starts in any receptacle
    (not (inReceptacle potato1 fridge1))
    (not (inReceptacle potato1 microwave1))
    (not (inReceptacle potato2 fridge1))
    (not (inReceptacle potato2 microwave1))

    ;; robot initially holds nothing
    (not (holdsAny robot))

    ;; potatoes are not heated initially (as per caption: no indication of hot)
    (not (isHot potato1))
    (not (isHot potato2))
  )

  (:goal
    (and
      ;; some potato is heated and placed in the fridge
      (exists (?p - object)
        (and
          (isHot ?p)
          (inReceptacle ?p fridge1)
        )
      )
    )
  )
)