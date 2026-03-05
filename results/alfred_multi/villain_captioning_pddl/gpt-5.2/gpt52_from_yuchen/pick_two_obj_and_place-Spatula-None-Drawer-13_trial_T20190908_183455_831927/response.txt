(define (problem put_task_spatulas_in_counter_drawer)
  (:domain put_task)

  (:objects
    robot - agent

    counterDrawer - receptacle

    spatula1 - object
    spatula2 - object

    countertop - object
  )

  (:init
    ;; robot starts not at any object's location (no atLocation facts for robot)

    ;; both spatulas are on the countertop (modeled as being in/on the countertop area)
    (inReceptacle spatula1 countertop)
    (inReceptacle spatula2 countertop)

    ;; allow navigating to these locations/objects by treating them as locations
    (atLocation spatula1 countertop)
    (atLocation spatula2 countertop)
  )

  (:goal
    (and
      (inReceptacle spatula1 counterDrawer)
      (inReceptacle spatula2 counterDrawer)
    )
  )
)