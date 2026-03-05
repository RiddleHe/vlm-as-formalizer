(define (problem put_task_kitchen_heat_tomato_sink)
  (:domain put_task)

  (:objects
    robot - agent

    sink1 - sink
    microwave1 - microwave

    tomato1 tomato2 - object
    apple1 - object
    potato1 potato2 - object
    bread1 - object
    papertowel1 - object
    spatula1 - object
    pot1 - object
    lettuce1 - object
  )

  (:init
    ;; Receptacle properties
    (openable microwave1)

    ;; Object locations (robot starts at no location per instruction)
    (atLocation robot sink1)
    (atLocation robot microwave1)
    (atLocation robot tomato1)
    (atLocation robot tomato2)
    (atLocation robot apple1)
    (atLocation robot potato1)
    (atLocation robot potato2)
    (atLocation robot bread1)
    (atLocation robot papertowel1)
    (atLocation robot spatula1)
    (atLocation robot pot1)
    (atLocation robot lettuce1)

    ;; In-receptacle relations from the scene
    (inReceptacle apple1 sink1)

    ;; Robot hand state
    (not (holdsAny robot))

    ;; Microwave door state not specified as open in the image
    (not (opened microwave1))
  )

  (:goal
    (and
      (inReceptacle tomato1 sink1)
      (isHot tomato1)
    )
  )
)