(define (problem put_task_bedroom_laptop_light)
  (:domain put_task)
  (:objects
    robot - agent
    laptop1 laptop2 light1 phone1 book1 pillow1 - object
  )
  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; object locations / visibility in scene
    (atLocation robot laptop1)
    (atLocation robot laptop2)
    (atLocation robot light1)
    (atLocation robot phone1)
    (atLocation robot book1)
    (atLocation robot pillow1)

    ;; light is initially off (so turning on is meaningful)
    (not (isOn light1))
  )
  (:goal
    (and
      (holds robot laptop1)
      (isOn light1)
      (isToggled light1)
    )
  )
)