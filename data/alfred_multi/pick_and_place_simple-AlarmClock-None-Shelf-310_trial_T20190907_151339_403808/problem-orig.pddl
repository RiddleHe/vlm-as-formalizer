
(define (problem plan_0_660)
    (:domain put_task)
    (:metric minimize (totalCost))
    (:objects
        agent1 - agent
        Painting - object
        Footstool - object
        Sink - object
        Box - object
        Knife - object
        Cup - object
        Laptop - object
        RemoteControl - object
        TissueBox - object
        SoapBar - object
        Candle - object
        Spatula - object
        CD - object
        LightSwitch - object
        Mirror - object
        Television - object
        ButterKnife - object
        ToiletPaperRoll - object
        TeddyBear - object
        Fork - object
        TennisRacket - object
        LaundryHamperLid - object
        HousePlant - object
        ScrubBrush - object
        AlarmClock - object
        Kettle - object
        ShowerDoor - object
        Mug - object
        Chair - object
        Statue - object
        Curtains - object
        Watch - object
        KeyChain - object
        SprayBottle - object
        Ladle - object
        DeskLamp - object
        Bread - object
        WateringCan - object
        Blinds - object
        CellPhone - object
        Lettuce - object
        CreditCard - object
        Pan - object
        Glassbottle - object
        Pencil - object
        Toaster - object
        Egg - object
        ShowerGlass - object
        WineBottle - object
        Newspaper - object
        PaperTowel - object
        HandTowel - object
        Book - object
        Plunger - object
        BaseballBat - object
        Cloth - object
        Plate - object
        DishSponge - object
        PaperTowelRoll - object
        Bowl - object
        Potato - object
        SaltShaker - object
        Vase - object
        SoapBottle - object
        Poster - object
        Tomato - object
        ToiletPaper - object
        Towel - object
        Pillow - object
        Apple - object
        PepperShaker - object
        Boots - object
        Window - object
        Pot - object
        Spoon - object
        BasketBall - object
        Pen - object
        FloorLamp - object
        Bathtub - object
        StoveKnob - object
        PaintingType - otype
        FootstoolType - otype
        SinkType - otype
        BoxType - otype
        KnifeType - otype
        CupType - otype
        LaptopType - otype
        RemoteControlType - otype
        TissueBoxType - otype
        SoapBarType - otype
        CandleType - otype
        SpatulaType - otype
        CDType - otype
        LightSwitchType - otype
        MirrorType - otype
        TelevisionType - otype
        ButterKnifeType - otype
        ToiletPaperRollType - otype
        TeddyBearType - otype
        ForkType - otype
        TennisRacketType - otype
        LaundryHamperLidType - otype
        HousePlantType - otype
        ScrubBrushType - otype
        AlarmClockType - otype
        KettleType - otype
        ShowerDoorType - otype
        MugType - otype
        ChairType - otype
        StatueType - otype
        CurtainsType - otype
        WatchType - otype
        KeyChainType - otype
        SprayBottleType - otype
        LadleType - otype
        DeskLampType - otype
        BreadType - otype
        WateringCanType - otype
        BlindsType - otype
        CellPhoneType - otype
        LettuceType - otype
        CreditCardType - otype
        PanType - otype
        GlassbottleType - otype
        PencilType - otype
        ToasterType - otype
        EggType - otype
        ShowerGlassType - otype
        WineBottleType - otype
        NewspaperType - otype
        PaperTowelType - otype
        HandTowelType - otype
        BookType - otype
        PlungerType - otype
        BaseballBatType - otype
        ClothType - otype
        PlateType - otype
        DishSpongeType - otype
        PaperTowelRollType - otype
        BowlType - otype
        PotatoType - otype
        SaltShakerType - otype
        VaseType - otype
        SoapBottleType - otype
        PosterType - otype
        TomatoType - otype
        ToiletPaperType - otype
        TowelType - otype
        PillowType - otype
        AppleType - otype
        PepperShakerType - otype
        BootsType - otype
        WindowType - otype
        PotType - otype
        SpoonType - otype
        BasketBallType - otype
        PenType - otype
        FloorLampType - otype
        BathtubType - otype
        StoveKnobType - otype
        LaundryHamperType - rtype
        SofaType - rtype
        SinkBasinType - rtype
        CoffeeMachineType - rtype
        CounterTopType - rtype
        CabinetType - rtype
        ShelfType - rtype
        OttomanType - rtype
        ToiletPaperHangerType - rtype
        BedType - rtype
        DeskType - rtype
        DresserType - rtype
        TowelHolderType - rtype
        BathtubBasinType - rtype
        MicrowaveType - rtype
        FridgeType - rtype
        CoffeeTableType - rtype
        HandTowelHolderType - rtype
        DiningTableType - rtype
        ToiletType - rtype
        GarbageCanType - rtype
        DrawerType - rtype
        SafeType - rtype
        ArmChairType - rtype
        StoveBurnerType - rtype
        CartType - rtype
        SideTableType - rtype


        AlarmClock_7_dot_04861404_comma_7_dot_04861404_comma__minus_4_dot_2614708_comma__minus_4_dot_2614708_comma_2_dot_723862172_comma_2_dot_723862172 - object
        AlarmClock__minus_5_dot_58515264_comma__minus_5_dot_58515264_comma__minus_8_dot_40740584_comma__minus_8_dot_40740584_comma_7_dot_10946228_comma_7_dot_10946228 - object
        AlarmClock__minus_5_dot_58515264_comma__minus_5_dot_58515264_comma__minus_9_dot_12720584_comma__minus_9_dot_12720584_comma_7_dot_10946228_comma_7_dot_10946228 - object
        Bed_4_dot_708_comma_4_dot_708_comma_0_dot_956_comma_0_dot_956_comma_0_dot_0_comma_0_dot_0 - receptacle
        GarbageCan_0_dot_512_comma_0_dot_512_comma__minus_8_dot_588_comma__minus_8_dot_588_comma_0_dot_0_comma_0_dot_0 - receptacle
        Cabinet__minus_3_dot_140939476_comma__minus_3_dot_140939476_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304 - receptacle
        Cabinet__minus_7_dot_350444_comma__minus_7_dot_350444_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304 - receptacle
        Cabinet__minus_4_dot_329756_comma__minus_4_dot_329756_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304 - receptacle
        Cabinet__minus_0_dot_1202516556_comma__minus_0_dot_1202516556_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304 - receptacle
        Shelf__minus_3_dot_757575036_comma__minus_3_dot_757575036_comma__minus_8_dot_4956_comma__minus_8_dot_4956_comma_5_dot_356_comma_5_dot_356 - receptacle
        Drawer_6_dot_412_comma_6_dot_412_comma__minus_3_dot_952_comma__minus_3_dot_952_comma_0_dot_6852_comma_0_dot_6852 - receptacle
        Drawer_6_dot_412_comma_6_dot_412_comma__minus_3_dot_952_comma__minus_3_dot_952_comma_1_dot_852_comma_1_dot_852 - receptacle
        Desk__minus_3_dot_849575044_comma__minus_3_dot_849575044_comma__minus_8_dot_224_comma__minus_8_dot_224_comma__minus_0_dot_008_comma__minus_0_dot_008 - receptacle
        SideTable_6_dot_412_comma_6_dot_412_comma__minus_3_dot_952_comma__minus_3_dot_952_comma_1_dot_852_comma_1_dot_852 - receptacle
        loc_bar__minus_6_bar__minus_5_bar_2_bar_0 - location
        loc_bar_5_bar__minus_7_bar_0_bar_60 - location
        loc_bar__minus_2_bar__minus_5_bar_2_bar_15 - location
        loc_bar__minus_1_bar__minus_5_bar_2_bar_15 - location
        loc_bar_5_bar__minus_4_bar_1_bar_60 - location
        loc_bar__minus_6_bar__minus_5_bar_2_bar_15 - location
        loc_bar_2_bar__minus_8_bar_3_bar_45 - location
        loc_bar_2_bar__minus_8_bar_3_bar_60 - location
        loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 - location
        loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 - location
        loc_bar_4_bar__minus_4_bar_1_bar_60 - location
        loc_bar_4_bar__minus_8_bar_0_bar_60 - location
        loc_bar__minus_2_bar_1_bar_1_bar_45 - location
        loc_bar__minus_2_bar_1_bar_0_bar_30 - location
        )


    (:init
        (= (totalCost) 0)
        (canContain TowelHolderType TowelType)
        (canContain BathtubBasinType ClothType)
        (canContain BathtubBasinType SoapBarType)
        (canContain BathtubBasinType DishSpongeType)
        (canContain BathtubBasinType HandTowelType)
        (canContain SofaType CreditCardType)
        (canContain SofaType BoxType)
        (canContain SofaType PillowType)
        (canContain SofaType NewspaperType)
        (canContain SofaType KeyChainType)
        (canContain SofaType LaptopType)
        (canContain SofaType BookType)
        (canContain SofaType RemoteControlType)
        (canContain SofaType ClothType)
        (canContain SofaType BasketBallType)
        (canContain SofaType CellPhoneType)
        (canContain MicrowaveType TomatoType)
        (canContain MicrowaveType GlassbottleType)
        (canContain MicrowaveType EggType)
        (canContain MicrowaveType AppleType)
        (canContain MicrowaveType CupType)
        (canContain MicrowaveType MugType)
        (canContain MicrowaveType BreadType)
        (canContain MicrowaveType PlateType)
        (canContain MicrowaveType BowlType)
        (canContain MicrowaveType PotatoType)
        (canContain SafeType VaseType)
        (canContain SafeType CreditCardType)
        (canContain SafeType StatueType)
        (canContain SafeType KeyChainType)
        (canContain SafeType WatchType)
        (canContain SafeType CDType)
        (canContain SafeType CellPhoneType)
        (canContain FridgeType TomatoType)
        (canContain FridgeType PanType)
        (canContain FridgeType GlassbottleType)
        (canContain FridgeType EggType)
        (canContain FridgeType AppleType)
        (canContain FridgeType WineBottleType)
        (canContain FridgeType MugType)
        (canContain FridgeType CupType)
        (canContain FridgeType PotType)
        (canContain FridgeType BreadType)
        (canContain FridgeType PlateType)
        (canContain FridgeType BowlType)
        (canContain FridgeType PotatoType)
        (canContain FridgeType LettuceType)
        (canContain CoffeeMachineType MugType)
        (canContain DiningTableType BoxType)
        (canContain DiningTableType KnifeType)
        (canContain DiningTableType CupType)
        (canContain DiningTableType LaptopType)
        (canContain DiningTableType RemoteControlType)
        (canContain DiningTableType TissueBoxType)
        (canContain DiningTableType SoapBarType)
        (canContain DiningTableType CandleType)
        (canContain DiningTableType SpatulaType)
        (canContain DiningTableType CDType)
        (canContain DiningTableType BasketBallType)
        (canContain DiningTableType TennisRacketType)
        (canContain DiningTableType ToiletPaperRollType)
        (canContain DiningTableType ButterKnifeType)
        (canContain DiningTableType ForkType)
        (canContain DiningTableType KettleType)
        (canContain DiningTableType AlarmClockType)
        (canContain DiningTableType StatueType)
        (canContain DiningTableType MugType)
        (canContain DiningTableType KeyChainType)
        (canContain DiningTableType WatchType)
        (canContain DiningTableType SprayBottleType)
        (canContain DiningTableType LadleType)
        (canContain DiningTableType BreadType)
        (canContain DiningTableType WateringCanType)
        (canContain DiningTableType LettuceType)
        (canContain DiningTableType CellPhoneType)
        (canContain DiningTableType CreditCardType)
        (canContain DiningTableType PanType)
        (canContain DiningTableType GlassbottleType)
        (canContain DiningTableType PencilType)
        (canContain DiningTableType EggType)
        (canContain DiningTableType WineBottleType)
        (canContain DiningTableType PaperTowelType)
        (canContain DiningTableType NewspaperType)
        (canContain DiningTableType BookType)
        (canContain DiningTableType ClothType)
        (canContain DiningTableType DishSpongeType)
        (canContain DiningTableType PlateType)
        (canContain DiningTableType BowlType)
        (canContain DiningTableType BaseballBatType)
        (canContain DiningTableType PotatoType)
        (canContain DiningTableType SaltShakerType)
        (canContain DiningTableType VaseType)
        (canContain DiningTableType SoapBottleType)
        (canContain DiningTableType TomatoType)
        (canContain DiningTableType ToiletPaperType)
        (canContain DiningTableType AppleType)
        (canContain DiningTableType PepperShakerType)
        (canContain DiningTableType PotType)
        (canContain DiningTableType SpoonType)
        (canContain DiningTableType HandTowelType)
        (canContain DiningTableType PenType)
        (canContain ToiletType ToiletPaperRollType)
        (canContain ToiletType ToiletPaperType)
        (canContain ToiletType PaperTowelType)
        (canContain ToiletType NewspaperType)
        (canContain ToiletType DishSpongeType)
        (canContain ToiletType SprayBottleType)
        (canContain ToiletType TissueBoxType)
        (canContain ToiletType SoapBarType)
        (canContain ToiletType ClothType)
        (canContain ToiletType HandTowelType)
        (canContain ToiletType CandleType)
        (canContain ToiletType SoapBottleType)
        (canContain GarbageCanType TissueBoxType)
        (canContain GarbageCanType SoapBarType)
        (canContain GarbageCanType CDType)
        (canContain GarbageCanType ToiletPaperRollType)
        (canContain GarbageCanType SprayBottleType)
        (canContain GarbageCanType BreadType)
        (canContain GarbageCanType LettuceType)
        (canContain GarbageCanType PencilType)
        (canContain GarbageCanType EggType)
        (canContain GarbageCanType WineBottleType)
        (canContain GarbageCanType PaperTowelType)
        (canContain GarbageCanType NewspaperType)
        (canContain GarbageCanType ClothType)
        (canContain GarbageCanType DishSpongeType)
        (canContain GarbageCanType PotatoType)
        (canContain GarbageCanType SoapBottleType)
        (canContain GarbageCanType TomatoType)
        (canContain GarbageCanType ToiletPaperType)
        (canContain GarbageCanType AppleType)
        (canContain GarbageCanType HandTowelType)
        (canContain GarbageCanType PenType)
        (canContain HandTowelHolderType HandTowelType)
        (canContain CabinetType BoxType)
        (canContain CabinetType CupType)
        (canContain CabinetType TissueBoxType)
        (canContain CabinetType SoapBarType)
        (canContain CabinetType CandleType)
        (canContain CabinetType CDType)
        (canContain CabinetType ToiletPaperRollType)
        (canContain CabinetType KettleType)
        (canContain CabinetType MugType)
        (canContain CabinetType SprayBottleType)
        (canContain CabinetType LadleType)
        (canContain CabinetType WateringCanType)
        (canContain CabinetType PanType)
        (canContain CabinetType GlassbottleType)
        (canContain CabinetType WineBottleType)
        (canContain CabinetType NewspaperType)
        (canContain CabinetType BookType)
        (canContain CabinetType PlungerType)
        (canContain CabinetType ClothType)
        (canContain CabinetType DishSpongeType)
        (canContain CabinetType PlateType)
        (canContain CabinetType BowlType)
        (canContain CabinetType SaltShakerType)
        (canContain CabinetType VaseType)
        (canContain CabinetType SoapBottleType)
        (canContain CabinetType ToiletPaperType)
        (canContain CabinetType PepperShakerType)
        (canContain CabinetType PotType)
        (canContain CabinetType HandTowelType)
        (canContain SideTableType BoxType)
        (canContain SideTableType KnifeType)
        (canContain SideTableType CupType)
        (canContain SideTableType LaptopType)
        (canContain SideTableType RemoteControlType)
        (canContain SideTableType TissueBoxType)
        (canContain SideTableType SoapBarType)
        (canContain SideTableType CandleType)
        (canContain SideTableType SpatulaType)
        (canContain SideTableType CDType)
        (canContain SideTableType BasketBallType)
        (canContain SideTableType TennisRacketType)
        (canContain SideTableType ToiletPaperRollType)
        (canContain SideTableType ButterKnifeType)
        (canContain SideTableType ForkType)
        (canContain SideTableType KettleType)
        (canContain SideTableType AlarmClockType)
        (canContain SideTableType StatueType)
        (canContain SideTableType MugType)
        (canContain SideTableType KeyChainType)
        (canContain SideTableType WatchType)
        (canContain SideTableType SprayBottleType)
        (canContain SideTableType LadleType)
        (canContain SideTableType BreadType)
        (canContain SideTableType WateringCanType)
        (canContain SideTableType LettuceType)
        (canContain SideTableType CellPhoneType)
        (canContain SideTableType CreditCardType)
        (canContain SideTableType PanType)
        (canContain SideTableType GlassbottleType)
        (canContain SideTableType PencilType)
        (canContain SideTableType EggType)
        (canContain SideTableType WineBottleType)
        (canContain SideTableType PaperTowelType)
        (canContain SideTableType NewspaperType)
        (canContain SideTableType BookType)
        (canContain SideTableType ClothType)
        (canContain SideTableType DishSpongeType)
        (canContain SideTableType PlateType)
        (canContain SideTableType BowlType)
        (canContain SideTableType BaseballBatType)
        (canContain SideTableType PotatoType)
        (canContain SideTableType SaltShakerType)
        (canContain SideTableType VaseType)
        (canContain SideTableType SoapBottleType)
        (canContain SideTableType TomatoType)
        (canContain SideTableType ToiletPaperType)
        (canContain SideTableType AppleType)
        (canContain SideTableType PepperShakerType)
        (canContain SideTableType PotType)
        (canContain SideTableType SpoonType)
        (canContain SideTableType HandTowelType)
        (canContain SideTableType PenType)
        (canContain OttomanType CreditCardType)
        (canContain OttomanType BoxType)
        (canContain OttomanType PillowType)
        (canContain OttomanType NewspaperType)
        (canContain OttomanType KeyChainType)
        (canContain OttomanType LaptopType)
        (canContain OttomanType BookType)
        (canContain OttomanType RemoteControlType)
        (canContain OttomanType ClothType)
        (canContain OttomanType BasketBallType)
        (canContain OttomanType CellPhoneType)
        (canContain CoffeeTableType BoxType)
        (canContain CoffeeTableType KnifeType)
        (canContain CoffeeTableType CupType)
        (canContain CoffeeTableType LaptopType)
        (canContain CoffeeTableType RemoteControlType)
        (canContain CoffeeTableType TissueBoxType)
        (canContain CoffeeTableType SoapBarType)
        (canContain CoffeeTableType CandleType)
        (canContain CoffeeTableType SpatulaType)
        (canContain CoffeeTableType CDType)
        (canContain CoffeeTableType BasketBallType)
        (canContain CoffeeTableType TennisRacketType)
        (canContain CoffeeTableType ToiletPaperRollType)
        (canContain CoffeeTableType ButterKnifeType)
        (canContain CoffeeTableType ForkType)
        (canContain CoffeeTableType KettleType)
        (canContain CoffeeTableType AlarmClockType)
        (canContain CoffeeTableType StatueType)
        (canContain CoffeeTableType MugType)
        (canContain CoffeeTableType KeyChainType)
        (canContain CoffeeTableType WatchType)
        (canContain CoffeeTableType SprayBottleType)
        (canContain CoffeeTableType LadleType)
        (canContain CoffeeTableType BreadType)
        (canContain CoffeeTableType WateringCanType)
        (canContain CoffeeTableType LettuceType)
        (canContain CoffeeTableType CellPhoneType)
        (canContain CoffeeTableType CreditCardType)
        (canContain CoffeeTableType PanType)
        (canContain CoffeeTableType GlassbottleType)
        (canContain CoffeeTableType PencilType)
        (canContain CoffeeTableType EggType)
        (canContain CoffeeTableType WineBottleType)
        (canContain CoffeeTableType PaperTowelType)
        (canContain CoffeeTableType NewspaperType)
        (canContain CoffeeTableType BookType)
        (canContain CoffeeTableType ClothType)
        (canContain CoffeeTableType DishSpongeType)
        (canContain CoffeeTableType PlateType)
        (canContain CoffeeTableType BowlType)
        (canContain CoffeeTableType BaseballBatType)
        (canContain CoffeeTableType PotatoType)
        (canContain CoffeeTableType SaltShakerType)
        (canContain CoffeeTableType VaseType)
        (canContain CoffeeTableType SoapBottleType)
        (canContain CoffeeTableType TomatoType)
        (canContain CoffeeTableType ToiletPaperType)
        (canContain CoffeeTableType AppleType)
        (canContain CoffeeTableType PepperShakerType)
        (canContain CoffeeTableType PotType)
        (canContain CoffeeTableType SpoonType)
        (canContain CoffeeTableType HandTowelType)
        (canContain CoffeeTableType PenType)
        (canContain ToiletPaperHangerType ToiletPaperRollType)
        (canContain ToiletPaperHangerType ToiletPaperType)
        (canContain DrawerType KnifeType)
        (canContain DrawerType RemoteControlType)
        (canContain DrawerType TissueBoxType)
        (canContain DrawerType SoapBarType)
        (canContain DrawerType CandleType)
        (canContain DrawerType SpatulaType)
        (canContain DrawerType CDType)
        (canContain DrawerType ButterKnifeType)
        (canContain DrawerType ToiletPaperRollType)
        (canContain DrawerType ForkType)
        (canContain DrawerType KeyChainType)
        (canContain DrawerType WatchType)
        (canContain DrawerType SprayBottleType)
        (canContain DrawerType LadleType)
        (canContain DrawerType WateringCanType)
        (canContain DrawerType CellPhoneType)
        (canContain DrawerType CreditCardType)
        (canContain DrawerType PencilType)
        (canContain DrawerType NewspaperType)
        (canContain DrawerType BookType)
        (canContain DrawerType ClothType)
        (canContain DrawerType DishSpongeType)
        (canContain DrawerType SaltShakerType)
        (canContain DrawerType SoapBottleType)
        (canContain DrawerType ToiletPaperType)
        (canContain DrawerType PepperShakerType)
        (canContain DrawerType SpoonType)
        (canContain DrawerType HandTowelType)
        (canContain DrawerType PenType)
        (canContain SinkBasinType KnifeType)
        (canContain SinkBasinType CupType)
        (canContain SinkBasinType SoapBarType)
        (canContain SinkBasinType SpatulaType)
        (canContain SinkBasinType ButterKnifeType)
        (canContain SinkBasinType ForkType)
        (canContain SinkBasinType KettleType)
        (canContain SinkBasinType MugType)
        (canContain SinkBasinType LadleType)
        (canContain SinkBasinType LettuceType)
        (canContain SinkBasinType PanType)
        (canContain SinkBasinType GlassbottleType)
        (canContain SinkBasinType EggType)
        (canContain SinkBasinType ClothType)
        (canContain SinkBasinType DishSpongeType)
        (canContain SinkBasinType PlateType)
        (canContain SinkBasinType BowlType)
        (canContain SinkBasinType PotatoType)
        (canContain SinkBasinType TomatoType)
        (canContain SinkBasinType AppleType)
        (canContain SinkBasinType PotType)
        (canContain SinkBasinType SpoonType)
        (canContain SinkBasinType HandTowelType)
        (canContain BedType PillowType)
        (canContain BedType NewspaperType)
        (canContain BedType LaptopType)
        (canContain BedType BookType)
        (canContain BedType BaseballBatType)
        (canContain BedType BasketBallType)
        (canContain BedType CellPhoneType)
        (canContain BedType TennisRacketType)
        (canContain ArmChairType CreditCardType)
        (canContain ArmChairType BoxType)
        (canContain ArmChairType PillowType)
        (canContain ArmChairType NewspaperType)
        (canContain ArmChairType KeyChainType)
        (canContain ArmChairType LaptopType)
        (canContain ArmChairType BookType)
        (canContain ArmChairType RemoteControlType)
        (canContain ArmChairType ClothType)
        (canContain ArmChairType BasketBallType)
        (canContain ArmChairType CellPhoneType)
        (canContain StoveBurnerType PanType)
        (canContain StoveBurnerType PotType)
        (canContain StoveBurnerType KettleType)
        (canContain CartType ToiletPaperRollType)
        (canContain CartType ToiletPaperType)
        (canContain CartType StatueType)
        (canContain CartType MugType)
        (canContain CartType PaperTowelType)
        (canContain CartType DishSpongeType)
        (canContain CartType SprayBottleType)
        (canContain CartType TissueBoxType)
        (canContain CartType SoapBarType)
        (canContain CartType PlungerType)
        (canContain CartType HandTowelType)
        (canContain CartType ClothType)
        (canContain CartType CandleType)
        (canContain CartType VaseType)
        (canContain CartType SoapBottleType)
        (canContain DeskType BoxType)
        (canContain DeskType CupType)
        (canContain DeskType LaptopType)
        (canContain DeskType RemoteControlType)
        (canContain DeskType TissueBoxType)
        (canContain DeskType CandleType)
        (canContain DeskType CDType)
        (canContain DeskType TennisRacketType)
        (canContain DeskType ToiletPaperRollType)
        (canContain DeskType AlarmClockType)
        (canContain DeskType StatueType)
        (canContain DeskType MugType)
        (canContain DeskType KeyChainType)
        (canContain DeskType WatchType)
        (canContain DeskType SprayBottleType)
        (canContain DeskType WateringCanType)
        (canContain DeskType CellPhoneType)
        (canContain DeskType CreditCardType)
        (canContain DeskType GlassbottleType)
        (canContain DeskType PencilType)
        (canContain DeskType WineBottleType)
        (canContain DeskType NewspaperType)
        (canContain DeskType BookType)
        (canContain DeskType ClothType)
        (canContain DeskType PlateType)
        (canContain DeskType BowlType)
        (canContain DeskType VaseType)
        (canContain DeskType SoapBottleType)
        (canContain DeskType ToiletPaperType)
        (canContain DeskType BasketBallType)
        (canContain DeskType PenType)
        (canContain LaundryHamperType ClothType)
        (canContain DresserType BoxType)
        (canContain DresserType CupType)
        (canContain DresserType LaptopType)
        (canContain DresserType RemoteControlType)
        (canContain DresserType TissueBoxType)
        (canContain DresserType CandleType)
        (canContain DresserType CDType)
        (canContain DresserType TennisRacketType)
        (canContain DresserType ToiletPaperRollType)
        (canContain DresserType AlarmClockType)
        (canContain DresserType StatueType)
        (canContain DresserType MugType)
        (canContain DresserType KeyChainType)
        (canContain DresserType WatchType)
        (canContain DresserType SprayBottleType)
        (canContain DresserType WateringCanType)
        (canContain DresserType CellPhoneType)
        (canContain DresserType CreditCardType)
        (canContain DresserType GlassbottleType)
        (canContain DresserType PencilType)
        (canContain DresserType WineBottleType)
        (canContain DresserType NewspaperType)
        (canContain DresserType BookType)
        (canContain DresserType ClothType)
        (canContain DresserType PlateType)
        (canContain DresserType BowlType)
        (canContain DresserType VaseType)
        (canContain DresserType ToiletPaperType)
        (canContain DresserType BasketBallType)
        (canContain DresserType PenType)
        (canContain CounterTopType BoxType)
        (canContain CounterTopType KnifeType)
        (canContain CounterTopType CupType)
        (canContain CounterTopType LaptopType)
        (canContain CounterTopType RemoteControlType)
        (canContain CounterTopType TissueBoxType)
        (canContain CounterTopType SoapBarType)
        (canContain CounterTopType CandleType)
        (canContain CounterTopType SpatulaType)
        (canContain CounterTopType CDType)
        (canContain CounterTopType BasketBallType)
        (canContain CounterTopType TennisRacketType)
        (canContain CounterTopType ToiletPaperRollType)
        (canContain CounterTopType ButterKnifeType)
        (canContain CounterTopType ForkType)
        (canContain CounterTopType KettleType)
        (canContain CounterTopType AlarmClockType)
        (canContain CounterTopType StatueType)
        (canContain CounterTopType MugType)
        (canContain CounterTopType KeyChainType)
        (canContain CounterTopType WatchType)
        (canContain CounterTopType SprayBottleType)
        (canContain CounterTopType LadleType)
        (canContain CounterTopType BreadType)
        (canContain CounterTopType WateringCanType)
        (canContain CounterTopType LettuceType)
        (canContain CounterTopType CellPhoneType)
        (canContain CounterTopType CreditCardType)
        (canContain CounterTopType PanType)
        (canContain CounterTopType GlassbottleType)
        (canContain CounterTopType PencilType)
        (canContain CounterTopType EggType)
        (canContain CounterTopType WineBottleType)
        (canContain CounterTopType PaperTowelType)
        (canContain CounterTopType NewspaperType)
        (canContain CounterTopType BookType)
        (canContain CounterTopType ClothType)
        (canContain CounterTopType DishSpongeType)
        (canContain CounterTopType PlateType)
        (canContain CounterTopType BowlType)
        (canContain CounterTopType BaseballBatType)
        (canContain CounterTopType PotatoType)
        (canContain CounterTopType SaltShakerType)
        (canContain CounterTopType VaseType)
        (canContain CounterTopType SoapBottleType)
        (canContain CounterTopType TomatoType)
        (canContain CounterTopType ToiletPaperType)
        (canContain CounterTopType AppleType)
        (canContain CounterTopType PepperShakerType)
        (canContain CounterTopType PotType)
        (canContain CounterTopType SpoonType)
        (canContain CounterTopType HandTowelType)
        (canContain CounterTopType PenType)


        (receptacleType Bed_4_dot_708_comma_4_dot_708_comma_0_dot_956_comma_0_dot_956_comma_0_dot_0_comma_0_dot_0 BedType)
        (receptacleType GarbageCan_0_dot_512_comma_0_dot_512_comma__minus_8_dot_588_comma__minus_8_dot_588_comma_0_dot_0_comma_0_dot_0 GarbageCanType)
        (receptacleType Cabinet__minus_3_dot_140939476_comma__minus_3_dot_140939476_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304 CabinetType)
        (receptacleType Cabinet__minus_7_dot_350444_comma__minus_7_dot_350444_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304 CabinetType)
        (receptacleType Cabinet__minus_4_dot_329756_comma__minus_4_dot_329756_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304 CabinetType)
        (receptacleType Cabinet__minus_0_dot_1202516556_comma__minus_0_dot_1202516556_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304 CabinetType)
        (receptacleType Shelf__minus_3_dot_757575036_comma__minus_3_dot_757575036_comma__minus_8_dot_4956_comma__minus_8_dot_4956_comma_5_dot_356_comma_5_dot_356 ShelfType)
        (receptacleType Drawer_6_dot_412_comma_6_dot_412_comma__minus_3_dot_952_comma__minus_3_dot_952_comma_0_dot_6852_comma_0_dot_6852 DrawerType)
        (receptacleType Drawer_6_dot_412_comma_6_dot_412_comma__minus_3_dot_952_comma__minus_3_dot_952_comma_1_dot_852_comma_1_dot_852 DrawerType)
        (receptacleType Desk__minus_3_dot_849575044_comma__minus_3_dot_849575044_comma__minus_8_dot_224_comma__minus_8_dot_224_comma__minus_0_dot_008_comma__minus_0_dot_008 DeskType)
        (receptacleType SideTable_6_dot_412_comma_6_dot_412_comma__minus_3_dot_952_comma__minus_3_dot_952_comma_1_dot_852_comma_1_dot_852 SideTableType)
        (objectType AlarmClock_7_dot_04861404_comma_7_dot_04861404_comma__minus_4_dot_2614708_comma__minus_4_dot_2614708_comma_2_dot_723862172_comma_2_dot_723862172 AlarmClockType)
        (objectType AlarmClock__minus_5_dot_58515264_comma__minus_5_dot_58515264_comma__minus_8_dot_40740584_comma__minus_8_dot_40740584_comma_7_dot_10946228_comma_7_dot_10946228 AlarmClockType)
        (objectType AlarmClock__minus_5_dot_58515264_comma__minus_5_dot_58515264_comma__minus_9_dot_12720584_comma__minus_9_dot_12720584_comma_7_dot_10946228_comma_7_dot_10946228 AlarmClockType)
        
        (openable Cabinet__minus_3_dot_140939476_comma__minus_3_dot_140939476_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304)
        (openable Cabinet__minus_7_dot_350444_comma__minus_7_dot_350444_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304)
        (openable Cabinet__minus_4_dot_329756_comma__minus_4_dot_329756_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304)
        (openable Cabinet__minus_0_dot_1202516556_comma__minus_0_dot_1202516556_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304)
        (openable Drawer_6_dot_412_comma_6_dot_412_comma__minus_3_dot_952_comma__minus_3_dot_952_comma_0_dot_6852_comma_0_dot_6852)
        (openable Drawer_6_dot_412_comma_6_dot_412_comma__minus_3_dot_952_comma__minus_3_dot_952_comma_1_dot_852_comma_1_dot_852)
        
        (atLocation agent1 loc_bar__minus_2_bar_1_bar_0_bar_30)
        
        
        
        
        
        
        
        
        
        
        
        
        (inReceptacle AlarmClock_7_dot_04861404_comma_7_dot_04861404_comma__minus_4_dot_2614708_comma__minus_4_dot_2614708_comma_2_dot_723862172_comma_2_dot_723862172 SideTable_6_dot_412_comma_6_dot_412_comma__minus_3_dot_952_comma__minus_3_dot_952_comma_1_dot_852_comma_1_dot_852)
        (inReceptacle AlarmClock__minus_5_dot_58515264_comma__minus_5_dot_58515264_comma__minus_8_dot_40740584_comma__minus_8_dot_40740584_comma_7_dot_10946228_comma_7_dot_10946228 Desk__minus_3_dot_849575044_comma__minus_3_dot_849575044_comma__minus_8_dot_224_comma__minus_8_dot_224_comma__minus_0_dot_008_comma__minus_0_dot_008)
        (inReceptacle AlarmClock__minus_5_dot_58515264_comma__minus_5_dot_58515264_comma__minus_9_dot_12720584_comma__minus_9_dot_12720584_comma_7_dot_10946228_comma_7_dot_10946228 Desk__minus_3_dot_849575044_comma__minus_3_dot_849575044_comma__minus_8_dot_224_comma__minus_8_dot_224_comma__minus_0_dot_008_comma__minus_0_dot_008)
        (wasInReceptacle  AlarmClock_7_dot_04861404_comma_7_dot_04861404_comma__minus_4_dot_2614708_comma__minus_4_dot_2614708_comma_2_dot_723862172_comma_2_dot_723862172 SideTable_6_dot_412_comma_6_dot_412_comma__minus_3_dot_952_comma__minus_3_dot_952_comma_1_dot_852_comma_1_dot_852)
        (wasInReceptacle  AlarmClock__minus_5_dot_58515264_comma__minus_5_dot_58515264_comma__minus_8_dot_40740584_comma__minus_8_dot_40740584_comma_7_dot_10946228_comma_7_dot_10946228 Desk__minus_3_dot_849575044_comma__minus_3_dot_849575044_comma__minus_8_dot_224_comma__minus_8_dot_224_comma__minus_0_dot_008_comma__minus_0_dot_008)
        (wasInReceptacle  AlarmClock__minus_5_dot_58515264_comma__minus_5_dot_58515264_comma__minus_9_dot_12720584_comma__minus_9_dot_12720584_comma_7_dot_10946228_comma_7_dot_10946228 Desk__minus_3_dot_849575044_comma__minus_3_dot_849575044_comma__minus_8_dot_224_comma__minus_8_dot_224_comma__minus_0_dot_008_comma__minus_0_dot_008)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_0 loc_bar_5_bar__minus_7_bar_0_bar_60) 20)
        (= (distance loc_bar_5_bar__minus_7_bar_0_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar_0) 20)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_0 loc_bar__minus_2_bar__minus_5_bar_2_bar_15) 8)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar_15 loc_bar__minus_6_bar__minus_5_bar_2_bar_0) 8)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_0 loc_bar__minus_1_bar__minus_5_bar_2_bar_15) 9)
        (= (distance loc_bar__minus_1_bar__minus_5_bar_2_bar_15 loc_bar__minus_6_bar__minus_5_bar_2_bar_0) 9)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_0 loc_bar_5_bar__minus_4_bar_1_bar_60) 20)
        (= (distance loc_bar_5_bar__minus_4_bar_1_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar_0) 20)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_0 loc_bar__minus_6_bar__minus_5_bar_2_bar_15) 2)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_15 loc_bar__minus_6_bar__minus_5_bar_2_bar_0) 2)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_0 loc_bar_2_bar__minus_8_bar_3_bar_45) 18)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_45 loc_bar__minus_6_bar__minus_5_bar_2_bar_0) 18)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_0 loc_bar__minus_2_bar_1_bar_0_bar_30) 15)
        (= (distance loc_bar__minus_2_bar_1_bar_0_bar_30 loc_bar__minus_6_bar__minus_5_bar_2_bar_0) 15)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_0 loc_bar_2_bar__minus_8_bar_3_bar_60) 19)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar_0) 19)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_0 loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30) 9)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 loc_bar__minus_6_bar__minus_5_bar_2_bar_0) 9)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_0 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15) 2)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 loc_bar__minus_6_bar__minus_5_bar_2_bar_0) 2)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_0 loc_bar_4_bar__minus_4_bar_1_bar_60) 19)
        (= (distance loc_bar_4_bar__minus_4_bar_1_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar_0) 19)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_0 loc_bar_4_bar__minus_8_bar_0_bar_60) 20)
        (= (distance loc_bar_4_bar__minus_8_bar_0_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar_0) 20)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_0 loc_bar__minus_2_bar_1_bar_1_bar_45) 17)
        (= (distance loc_bar__minus_2_bar_1_bar_1_bar_45 loc_bar__minus_6_bar__minus_5_bar_2_bar_0) 17)
        (= (distance loc_bar_5_bar__minus_7_bar_0_bar_60 loc_bar__minus_2_bar__minus_5_bar_2_bar_15) 15)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar_15 loc_bar_5_bar__minus_7_bar_0_bar_60) 15)
        (= (distance loc_bar_5_bar__minus_7_bar_0_bar_60 loc_bar__minus_1_bar__minus_5_bar_2_bar_15) 14)
        (= (distance loc_bar__minus_1_bar__minus_5_bar_2_bar_15 loc_bar_5_bar__minus_7_bar_0_bar_60) 14)
        (= (distance loc_bar_5_bar__minus_7_bar_0_bar_60 loc_bar_5_bar__minus_4_bar_1_bar_60) 5)
        (= (distance loc_bar_5_bar__minus_4_bar_1_bar_60 loc_bar_5_bar__minus_7_bar_0_bar_60) 5)
        (= (distance loc_bar_5_bar__minus_7_bar_0_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar_15) 19)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_15 loc_bar_5_bar__minus_7_bar_0_bar_60) 19)
        (= (distance loc_bar_5_bar__minus_7_bar_0_bar_60 loc_bar_2_bar__minus_8_bar_3_bar_45) 9)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_45 loc_bar_5_bar__minus_7_bar_0_bar_60) 9)
        (= (distance loc_bar_5_bar__minus_7_bar_0_bar_60 loc_bar__minus_2_bar_1_bar_0_bar_30) 20)
        (= (distance loc_bar__minus_2_bar_1_bar_0_bar_30 loc_bar_5_bar__minus_7_bar_0_bar_60) 20)
        (= (distance loc_bar_5_bar__minus_7_bar_0_bar_60 loc_bar_2_bar__minus_8_bar_3_bar_60) 8)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_60 loc_bar_5_bar__minus_7_bar_0_bar_60) 8)
        (= (distance loc_bar_5_bar__minus_7_bar_0_bar_60 loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30) 18)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 loc_bar_5_bar__minus_7_bar_0_bar_60) 18)
        (= (distance loc_bar_5_bar__minus_7_bar_0_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15) 21)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 loc_bar_5_bar__minus_7_bar_0_bar_60) 21)
        (= (distance loc_bar_5_bar__minus_7_bar_0_bar_60 loc_bar_4_bar__minus_4_bar_1_bar_60) 8)
        (= (distance loc_bar_4_bar__minus_4_bar_1_bar_60 loc_bar_5_bar__minus_7_bar_0_bar_60) 8)
        (= (distance loc_bar_5_bar__minus_7_bar_0_bar_60 loc_bar_4_bar__minus_8_bar_0_bar_60) 7)
        (= (distance loc_bar_4_bar__minus_8_bar_0_bar_60 loc_bar_5_bar__minus_7_bar_0_bar_60) 7)
        (= (distance loc_bar_5_bar__minus_7_bar_0_bar_60 loc_bar__minus_2_bar_1_bar_1_bar_45) 20)
        (= (distance loc_bar__minus_2_bar_1_bar_1_bar_45 loc_bar_5_bar__minus_7_bar_0_bar_60) 20)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar_15 loc_bar__minus_1_bar__minus_5_bar_2_bar_15) 4)
        (= (distance loc_bar__minus_1_bar__minus_5_bar_2_bar_15 loc_bar__minus_2_bar__minus_5_bar_2_bar_15) 4)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar_15 loc_bar_5_bar__minus_4_bar_1_bar_60) 15)
        (= (distance loc_bar_5_bar__minus_4_bar_1_bar_60 loc_bar__minus_2_bar__minus_5_bar_2_bar_15) 15)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar_15 loc_bar__minus_6_bar__minus_5_bar_2_bar_15) 7)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_15 loc_bar__minus_2_bar__minus_5_bar_2_bar_15) 7)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar_15 loc_bar_2_bar__minus_8_bar_3_bar_45) 13)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_45 loc_bar__minus_2_bar__minus_5_bar_2_bar_15) 13)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar_15 loc_bar__minus_2_bar_1_bar_0_bar_30) 10)
        (= (distance loc_bar__minus_2_bar_1_bar_0_bar_30 loc_bar__minus_2_bar__minus_5_bar_2_bar_15) 10)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar_15 loc_bar_2_bar__minus_8_bar_3_bar_60) 14)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_60 loc_bar__minus_2_bar__minus_5_bar_2_bar_15) 14)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar_15 loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30) 4)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 loc_bar__minus_2_bar__minus_5_bar_2_bar_15) 4)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar_15 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15) 9)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 loc_bar__minus_2_bar__minus_5_bar_2_bar_15) 9)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar_15 loc_bar_4_bar__minus_4_bar_1_bar_60) 14)
        (= (distance loc_bar_4_bar__minus_4_bar_1_bar_60 loc_bar__minus_2_bar__minus_5_bar_2_bar_15) 14)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar_15 loc_bar_4_bar__minus_8_bar_0_bar_60) 15)
        (= (distance loc_bar_4_bar__minus_8_bar_0_bar_60 loc_bar__minus_2_bar__minus_5_bar_2_bar_15) 15)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar_15 loc_bar__minus_2_bar_1_bar_1_bar_45) 12)
        (= (distance loc_bar__minus_2_bar_1_bar_1_bar_45 loc_bar__minus_2_bar__minus_5_bar_2_bar_15) 12)
        (= (distance loc_bar__minus_1_bar__minus_5_bar_2_bar_15 loc_bar_5_bar__minus_4_bar_1_bar_60) 14)
        (= (distance loc_bar_5_bar__minus_4_bar_1_bar_60 loc_bar__minus_1_bar__minus_5_bar_2_bar_15) 14)
        (= (distance loc_bar__minus_1_bar__minus_5_bar_2_bar_15 loc_bar__minus_6_bar__minus_5_bar_2_bar_15) 8)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_15 loc_bar__minus_1_bar__minus_5_bar_2_bar_15) 8)
        (= (distance loc_bar__minus_1_bar__minus_5_bar_2_bar_15 loc_bar_2_bar__minus_8_bar_3_bar_45) 12)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_45 loc_bar__minus_1_bar__minus_5_bar_2_bar_15) 12)
        (= (distance loc_bar__minus_1_bar__minus_5_bar_2_bar_15 loc_bar__minus_2_bar_1_bar_0_bar_30) 11)
        (= (distance loc_bar__minus_2_bar_1_bar_0_bar_30 loc_bar__minus_1_bar__minus_5_bar_2_bar_15) 11)
        (= (distance loc_bar__minus_1_bar__minus_5_bar_2_bar_15 loc_bar_2_bar__minus_8_bar_3_bar_60) 13)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_60 loc_bar__minus_1_bar__minus_5_bar_2_bar_15) 13)
        (= (distance loc_bar__minus_1_bar__minus_5_bar_2_bar_15 loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30) 7)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 loc_bar__minus_1_bar__minus_5_bar_2_bar_15) 7)
        (= (distance loc_bar__minus_1_bar__minus_5_bar_2_bar_15 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15) 10)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 loc_bar__minus_1_bar__minus_5_bar_2_bar_15) 10)
        (= (distance loc_bar__minus_1_bar__minus_5_bar_2_bar_15 loc_bar_4_bar__minus_4_bar_1_bar_60) 13)
        (= (distance loc_bar_4_bar__minus_4_bar_1_bar_60 loc_bar__minus_1_bar__minus_5_bar_2_bar_15) 13)
        (= (distance loc_bar__minus_1_bar__minus_5_bar_2_bar_15 loc_bar_4_bar__minus_8_bar_0_bar_60) 14)
        (= (distance loc_bar_4_bar__minus_8_bar_0_bar_60 loc_bar__minus_1_bar__minus_5_bar_2_bar_15) 14)
        (= (distance loc_bar__minus_1_bar__minus_5_bar_2_bar_15 loc_bar__minus_2_bar_1_bar_1_bar_45) 13)
        (= (distance loc_bar__minus_2_bar_1_bar_1_bar_45 loc_bar__minus_1_bar__minus_5_bar_2_bar_15) 13)
        (= (distance loc_bar_5_bar__minus_4_bar_1_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar_15) 19)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_15 loc_bar_5_bar__minus_4_bar_1_bar_60) 19)
        (= (distance loc_bar_5_bar__minus_4_bar_1_bar_60 loc_bar_2_bar__minus_8_bar_3_bar_45) 11)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_45 loc_bar_5_bar__minus_4_bar_1_bar_60) 11)
        (= (distance loc_bar_5_bar__minus_4_bar_1_bar_60 loc_bar__minus_2_bar_1_bar_0_bar_30) 18)
        (= (distance loc_bar__minus_2_bar_1_bar_0_bar_30 loc_bar_5_bar__minus_4_bar_1_bar_60) 18)
        (= (distance loc_bar_5_bar__minus_4_bar_1_bar_60 loc_bar_2_bar__minus_8_bar_3_bar_60) 10)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_60 loc_bar_5_bar__minus_4_bar_1_bar_60) 10)
        (= (distance loc_bar_5_bar__minus_4_bar_1_bar_60 loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30) 18)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 loc_bar_5_bar__minus_4_bar_1_bar_60) 18)
        (= (distance loc_bar_5_bar__minus_4_bar_1_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15) 21)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 loc_bar_5_bar__minus_4_bar_1_bar_60) 21)
        (= (distance loc_bar_5_bar__minus_4_bar_1_bar_60 loc_bar_4_bar__minus_4_bar_1_bar_60) 6)
        (= (distance loc_bar_4_bar__minus_4_bar_1_bar_60 loc_bar_5_bar__minus_4_bar_1_bar_60) 6)
        (= (distance loc_bar_5_bar__minus_4_bar_1_bar_60 loc_bar_4_bar__minus_8_bar_0_bar_60) 9)
        (= (distance loc_bar_4_bar__minus_8_bar_0_bar_60 loc_bar_5_bar__minus_4_bar_1_bar_60) 9)
        (= (distance loc_bar_5_bar__minus_4_bar_1_bar_60 loc_bar__minus_2_bar_1_bar_1_bar_45) 18)
        (= (distance loc_bar__minus_2_bar_1_bar_1_bar_45 loc_bar_5_bar__minus_4_bar_1_bar_60) 18)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_15 loc_bar_2_bar__minus_8_bar_3_bar_45) 17)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_45 loc_bar__minus_6_bar__minus_5_bar_2_bar_15) 17)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_15 loc_bar__minus_2_bar_1_bar_0_bar_30) 14)
        (= (distance loc_bar__minus_2_bar_1_bar_0_bar_30 loc_bar__minus_6_bar__minus_5_bar_2_bar_15) 14)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_15 loc_bar_2_bar__minus_8_bar_3_bar_60) 18)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar_15) 18)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_15 loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30) 10)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 loc_bar__minus_6_bar__minus_5_bar_2_bar_15) 10)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_15 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15) 3)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 loc_bar__minus_6_bar__minus_5_bar_2_bar_15) 3)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_15 loc_bar_4_bar__minus_4_bar_1_bar_60) 18)
        (= (distance loc_bar_4_bar__minus_4_bar_1_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar_15) 18)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_15 loc_bar_4_bar__minus_8_bar_0_bar_60) 19)
        (= (distance loc_bar_4_bar__minus_8_bar_0_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar_15) 19)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar_15 loc_bar__minus_2_bar_1_bar_1_bar_45) 16)
        (= (distance loc_bar__minus_2_bar_1_bar_1_bar_45 loc_bar__minus_6_bar__minus_5_bar_2_bar_15) 16)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_45 loc_bar__minus_2_bar_1_bar_0_bar_30) 16)
        (= (distance loc_bar__minus_2_bar_1_bar_0_bar_30 loc_bar_2_bar__minus_8_bar_3_bar_45) 16)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_45 loc_bar_2_bar__minus_8_bar_3_bar_60) 2)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_60 loc_bar_2_bar__minus_8_bar_3_bar_45) 2)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_45 loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30) 16)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 loc_bar_2_bar__minus_8_bar_3_bar_45) 16)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_45 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15) 19)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 loc_bar_2_bar__minus_8_bar_3_bar_45) 19)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_45 loc_bar_4_bar__minus_4_bar_1_bar_60) 10)
        (= (distance loc_bar_4_bar__minus_4_bar_1_bar_60 loc_bar_2_bar__minus_8_bar_3_bar_45) 10)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_45 loc_bar_4_bar__minus_8_bar_0_bar_60) 7)
        (= (distance loc_bar_4_bar__minus_8_bar_0_bar_60 loc_bar_2_bar__minus_8_bar_3_bar_45) 7)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_45 loc_bar__minus_2_bar_1_bar_1_bar_45) 16)
        (= (distance loc_bar__minus_2_bar_1_bar_1_bar_45 loc_bar_2_bar__minus_8_bar_3_bar_45) 16)
        (= (distance loc_bar__minus_2_bar_1_bar_0_bar_30 loc_bar_2_bar__minus_8_bar_3_bar_60) 19)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_60 loc_bar__minus_2_bar_1_bar_0_bar_30) 19)
        (= (distance loc_bar__minus_2_bar_1_bar_0_bar_30 loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30) 13)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 loc_bar__minus_2_bar_1_bar_0_bar_30) 13)
        (= (distance loc_bar__minus_2_bar_1_bar_0_bar_30 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15) 16)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 loc_bar__minus_2_bar_1_bar_0_bar_30) 16)
        (= (distance loc_bar__minus_2_bar_1_bar_0_bar_30 loc_bar_4_bar__minus_4_bar_1_bar_60) 17)
        (= (distance loc_bar_4_bar__minus_4_bar_1_bar_60 loc_bar__minus_2_bar_1_bar_0_bar_30) 17)
        (= (distance loc_bar__minus_2_bar_1_bar_0_bar_30 loc_bar_4_bar__minus_8_bar_0_bar_60) 22)
        (= (distance loc_bar_4_bar__minus_8_bar_0_bar_60 loc_bar__minus_2_bar_1_bar_0_bar_30) 22)
        (= (distance loc_bar__minus_2_bar_1_bar_0_bar_30 loc_bar__minus_2_bar_1_bar_1_bar_45) 3)
        (= (distance loc_bar__minus_2_bar_1_bar_1_bar_45 loc_bar__minus_2_bar_1_bar_0_bar_30) 3)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_60 loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30) 17)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 loc_bar_2_bar__minus_8_bar_3_bar_60) 17)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15) 20)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 loc_bar_2_bar__minus_8_bar_3_bar_60) 20)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_60 loc_bar_4_bar__minus_4_bar_1_bar_60) 9)
        (= (distance loc_bar_4_bar__minus_4_bar_1_bar_60 loc_bar_2_bar__minus_8_bar_3_bar_60) 9)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_60 loc_bar_4_bar__minus_8_bar_0_bar_60) 6)
        (= (distance loc_bar_4_bar__minus_8_bar_0_bar_60 loc_bar_2_bar__minus_8_bar_3_bar_60) 6)
        (= (distance loc_bar_2_bar__minus_8_bar_3_bar_60 loc_bar__minus_2_bar_1_bar_1_bar_45) 17)
        (= (distance loc_bar__minus_2_bar_1_bar_1_bar_45 loc_bar_2_bar__minus_8_bar_3_bar_60) 17)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15) 8)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30) 8)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 loc_bar_4_bar__minus_4_bar_1_bar_60) 17)
        (= (distance loc_bar_4_bar__minus_4_bar_1_bar_60 loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30) 17)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 loc_bar_4_bar__minus_8_bar_0_bar_60) 18)
        (= (distance loc_bar_4_bar__minus_8_bar_0_bar_60 loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30) 18)
        (= (distance loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30 loc_bar__minus_2_bar_1_bar_1_bar_45) 15)
        (= (distance loc_bar__minus_2_bar_1_bar_1_bar_45 loc_bar__minus_2_bar__minus_5_bar_2_bar__minus_30) 15)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 loc_bar_4_bar__minus_4_bar_1_bar_60) 20)
        (= (distance loc_bar_4_bar__minus_4_bar_1_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15) 20)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 loc_bar_4_bar__minus_8_bar_0_bar_60) 21)
        (= (distance loc_bar_4_bar__minus_8_bar_0_bar_60 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15) 21)
        (= (distance loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15 loc_bar__minus_2_bar_1_bar_1_bar_45) 18)
        (= (distance loc_bar__minus_2_bar_1_bar_1_bar_45 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15) 18)
        (= (distance loc_bar_4_bar__minus_4_bar_1_bar_60 loc_bar_4_bar__minus_8_bar_0_bar_60) 8)
        (= (distance loc_bar_4_bar__minus_8_bar_0_bar_60 loc_bar_4_bar__minus_4_bar_1_bar_60) 8)
        (= (distance loc_bar_4_bar__minus_4_bar_1_bar_60 loc_bar__minus_2_bar_1_bar_1_bar_45) 17)
        (= (distance loc_bar__minus_2_bar_1_bar_1_bar_45 loc_bar_4_bar__minus_4_bar_1_bar_60) 17)
        (= (distance loc_bar_4_bar__minus_8_bar_0_bar_60 loc_bar__minus_2_bar_1_bar_1_bar_45) 20)
        (= (distance loc_bar__minus_2_bar_1_bar_1_bar_45 loc_bar_4_bar__minus_8_bar_0_bar_60) 20)
        (receptacleAtLocation Bed_4_dot_708_comma_4_dot_708_comma_0_dot_956_comma_0_dot_956_comma_0_dot_0_comma_0_dot_0 loc_bar__minus_2_bar_1_bar_1_bar_45)
        (receptacleAtLocation GarbageCan_0_dot_512_comma_0_dot_512_comma__minus_8_dot_588_comma__minus_8_dot_588_comma_0_dot_0_comma_0_dot_0 loc_bar_2_bar__minus_8_bar_3_bar_60)
        (receptacleAtLocation Cabinet__minus_3_dot_140939476_comma__minus_3_dot_140939476_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304 loc_bar__minus_2_bar__minus_5_bar_2_bar_15)
        (receptacleAtLocation Cabinet__minus_7_dot_350444_comma__minus_7_dot_350444_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304 loc_bar__minus_6_bar__minus_5_bar_2_bar_15)
        (receptacleAtLocation Cabinet__minus_4_dot_329756_comma__minus_4_dot_329756_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304 loc_bar__minus_6_bar__minus_5_bar_2_bar_15)
        (receptacleAtLocation Cabinet__minus_0_dot_1202516556_comma__minus_0_dot_1202516556_comma__minus_7_dot_674432_comma__minus_7_dot_674432_comma_6_dot_10477304_comma_6_dot_10477304 loc_bar__minus_1_bar__minus_5_bar_2_bar_15)
        (receptacleAtLocation Shelf__minus_3_dot_757575036_comma__minus_3_dot_757575036_comma__minus_8_dot_4956_comma__minus_8_dot_4956_comma_5_dot_356_comma_5_dot_356 loc_bar__minus_2_bar__minus_5_bar_2_bar_15)
        (receptacleAtLocation Drawer_6_dot_412_comma_6_dot_412_comma__minus_3_dot_952_comma__minus_3_dot_952_comma_0_dot_6852_comma_0_dot_6852 loc_bar_4_bar__minus_8_bar_0_bar_60)
        (receptacleAtLocation Drawer_6_dot_412_comma_6_dot_412_comma__minus_3_dot_952_comma__minus_3_dot_952_comma_1_dot_852_comma_1_dot_852 loc_bar_5_bar__minus_7_bar_0_bar_60)
        (receptacleAtLocation Desk__minus_3_dot_849575044_comma__minus_3_dot_849575044_comma__minus_8_dot_224_comma__minus_8_dot_224_comma__minus_0_dot_008_comma__minus_0_dot_008 loc_bar_2_bar__minus_8_bar_3_bar_45)
        (receptacleAtLocation SideTable_6_dot_412_comma_6_dot_412_comma__minus_3_dot_952_comma__minus_3_dot_952_comma_1_dot_852_comma_1_dot_852 loc_bar_4_bar__minus_4_bar_1_bar_60)
        (objectAtLocation AlarmClock_7_dot_04861404_comma_7_dot_04861404_comma__minus_4_dot_2614708_comma__minus_4_dot_2614708_comma_2_dot_723862172_comma_2_dot_723862172 loc_bar_5_bar__minus_4_bar_1_bar_60)
        (objectAtLocation AlarmClock__minus_5_dot_58515264_comma__minus_5_dot_58515264_comma__minus_8_dot_40740584_comma__minus_8_dot_40740584_comma_7_dot_10946228_comma_7_dot_10946228 loc_bar__minus_6_bar__minus_5_bar_2_bar__minus_15)
        (objectAtLocation AlarmClock__minus_5_dot_58515264_comma__minus_5_dot_58515264_comma__minus_9_dot_12720584_comma__minus_9_dot_12720584_comma_7_dot_10946228_comma_7_dot_10946228 loc_bar__minus_6_bar__minus_5_bar_2_bar_0)
        )


        (:goal
            (and
                (exists (?r - receptacle)
                    (exists (?o - object)
                        (and 
                            (inReceptacle ?o ?r) 
                            (objectType ?o AlarmClockType) 
                            (receptacleType ?r ShelfType)
                        )
                    )
                )
                (forall (?re - receptacle)
                    (not (opened ?re))
                )
            )
        )
    )
    