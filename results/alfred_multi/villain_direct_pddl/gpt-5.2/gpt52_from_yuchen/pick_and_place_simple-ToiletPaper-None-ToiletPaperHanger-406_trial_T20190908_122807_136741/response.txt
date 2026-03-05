(define (problem bathroom_put_toiletpaper)
  (:domain put_task)

  (:objects
    robot - agent
    toiletpaper_roll - object
    toiletpaper_dispenser - receptacle
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts)

    ;; Scene object placements (from image)
    (inReceptacle toiletpaper_roll toiletpaper_dispenser)
  )

  (:goal
    (and
      (inReceptacle toiletpaper_roll toiletpaper_dispenser)
    )
  )
)