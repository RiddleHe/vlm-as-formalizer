(define (problem kitchen_put_task_bread_slice_fridge_counter)
  (:domain put_task)

  (:objects
    robot - agent

    ;; receptacles / locations
    fridge1 - fridge

    ;; objects
    bread1 - object
    apple1 - object
    knife1 - knife
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; object locations (treat counter as being "at" the fridge area for interaction)
    (atLocation robot fridge1)
    (atLocation robot bread1)
    (atLocation robot apple1)
    (atLocation robot knife1)
  )

  (:goal
    (and
      ;; cut the bread
      (isSliced bread1)

      ;; bread has been in the fridge at some point; final placement required is on counter
      ;; (we ensure final state is NOT in fridge)
      (not (inReceptacle bread1 fridge1))

      ;; place bread on counter next to apple (approximated by co-locating bread with apple)
      (atLocation robot apple1)
      (atLocation robot bread1)
    )
  )
)