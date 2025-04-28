(define (problem slice-veg)
  (:domain cooking)
  (:objects
    robot1 - robot
    carrot cucumber bowl knife chopping_board - object
    carrot_veg cucumber_veg - vegetable
    tool1 - tool
    tray plate elevated_platform - location
  )
  (:init
    (at robot1 tray)
    (at carrot tray)
    (at carrot_veg tray)
    (at cucumber plate)
    (at cucumber_veg plate)
    (at bowl tray)
    (at knife elevated_platform)
    (at chopping_board elevated_platform)
  )
  (:goal
    (and
      (sliced carrot_veg)
      (placed_in carrot_veg bowl)
      (placed_in cucumber_veg bowl)
    )
  )
)