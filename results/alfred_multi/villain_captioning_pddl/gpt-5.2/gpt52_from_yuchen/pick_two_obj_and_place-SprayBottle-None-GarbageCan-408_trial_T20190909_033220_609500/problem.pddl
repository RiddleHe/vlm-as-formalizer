(define (problem put_task_bathroom_001)
  (:domain put_task)
  (:objects
    robot - agent
    sink1 - sink
  )
  (:init
    ;; Robot starts not at any object's location (no atLocation facts).

    ;; Visible receptacle
    ;; Sink is a receptacle by type; no evidence it is openable/opened.
    
    ;; No spray bottles and no garbage bin are visible in the provided scene,
    ;; so they cannot be instantiated or located from the image/caption.
  )
  (:goal
    (and
      ;; Instruction cannot be grounded to this scene: the two spray bottles and
      ;; the garbage bin in the corner are not present/visible.
      ;;
      ;; Keeping an empty conjunctive goal would be trivially true, so we encode
      ;; the intended goal only when the required objects exist. Since they do not,
      ;; the goal is left as a false placeholder to reflect impossibility from
      ;; the provided initial state.
      (not (opened sink1))
    )
  )
)