(define (problem put_two_salt_shakers_in_cabinet)
  (:domain put_task)
  (:objects
    robot - agent
    cabinet - receptacle
    saltshaker1 saltshaker2 - object
  )

  (:init
    ;; receptacle properties
    (openable cabinet)

    ;; object locations (both salt shakers are on the small shelf area by the stove)
    (atLocation robot saltshaker1)
    (atLocation robot saltshaker2)
  )

  (:goal
    (and
      (inReceptacle saltshaker1 cabinet)
      (inReceptacle saltshaker2 cabinet)
    )
  )
)