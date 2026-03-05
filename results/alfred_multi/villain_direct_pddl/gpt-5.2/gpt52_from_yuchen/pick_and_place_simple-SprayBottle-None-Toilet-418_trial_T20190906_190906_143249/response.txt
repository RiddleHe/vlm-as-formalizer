(define (problem put_spray_on_toilet)
  (:domain put_task)
  (:objects
    robot - agent
    spray_bottle - object
    toilet - receptacle
  )
  (:init
    ;; Robot starts not at any object location (no atLocation facts)

    ;; Scene object locations (use toilet as the target receptacle)
    (atLocation robot spray_bottle)
    ;; Note: do not assert (atLocation robot toilet) initially per instruction.
  )
  (:goal
    (and
      (inReceptacle spray_bottle toilet)
    )
  )
)