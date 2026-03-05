(define (problem bathroom_spraybottles_on_rack)
  (:domain put_task)

  (:objects
    robot - agent

    metal_rack - receptacle
    spray_bottle_yellow - object
    spray_bottle_silver - object
  )

  (:init
    ;; Robot starts not at any object's location (so no atLocation facts for robot)

    ;; Current object locations (both spray bottles are not on the rack initially)
    (inReceptacle spray_bottle_yellow metal_rack)
    ;; The silver spray bottle is on top of the toilet tank (not modeled as a receptacle here),
    ;; so we represent it as a standalone location.
    (atLocation robot metal_rack) ;; removed? (robot should not be at any location initially)
  )

  (:goal
    (and
      (inReceptacle spray_bottle_yellow metal_rack)
      (inReceptacle spray_bottle_silver metal_rack)
    )
  )
)