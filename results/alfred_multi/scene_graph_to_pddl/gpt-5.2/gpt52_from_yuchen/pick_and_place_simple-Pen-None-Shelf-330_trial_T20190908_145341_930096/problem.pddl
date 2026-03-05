(define (problem put_task_pen_to_dresser)
  (:domain put_task)
  (:objects
    robot - agent
    dark_wood_dresser_top_surface_receptacle - receptacle
    blue_hexagonal_trash_bin_receptacle - receptacle
    black_pen_like_object - object
    metal_keyring_with_keys - object
    white_cylinder_container_on_dresser - object
  )
  (:init
    ;; Object locations (via receptacles)
    (inReceptacle black_pen_like_object blue_hexagonal_trash_bin_receptacle)
  )
  (:goal
    (and
      (inReceptacle black_pen_like_object dark_wood_dresser_top_surface_receptacle)
    )
  )
)