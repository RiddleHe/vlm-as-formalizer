
(define (problem plan_0_430)
    (:domain put_task)
    (:metric minimize (totalCost))
    (:objects
        agent1 - agent
        AlarmClock - object
        Footstool - object
        TissueBox - object
        Spatula - object
        Candle - object
        Bread - object
        WateringCan - object
        Knife - object
        Apple - object
        TeddyBear - object
        PaperTowelRoll - object
        Mug - object
        Ladle - object
        Statue - object
        StoveKnob - object
        Watch - object
        CellPhone - object
        Cup - object
        Towel - object
        Glassbottle - object
        Plunger - object
        Kettle - object
        ToiletPaperRoll - object
        Plate - object
        DeskLamp - object
        Book - object
        Television - object
        Bathtub - object
        Potato - object
        Pillow - object
        SoapBottle - object
        Box - object
        Newspaper - object
        LightSwitch - object
        ButterKnife - object
        RemoteControl - object
        Laptop - object
        ShowerGlass - object
        WineBottle - object
        Sink - object
        Blinds - object
        TennisRacket - object
        BasketBall - object
        Vase - object
        Tomato - object
        Spoon - object
        Window - object
        Egg - object
        Curtains - object
        Pencil - object
        Cloth - object
        Painting - object
        SprayBottle - object
        CD - object
        ScrubBrush - object
        PaperTowel - object
        Mirror - object
        Bowl - object
        SaltShaker - object
        DishSponge - object
        LaundryHamperLid - object
        Pot - object
        CreditCard - object
        BaseballBat - object
        SoapBar - object
        KeyChain - object
        Pen - object
        Fork - object
        Toaster - object
        Pan - object
        HousePlant - object
        Chair - object
        ToiletPaper - object
        FloorLamp - object
        HandTowel - object
        Boots - object
        Poster - object
        ShowerDoor - object
        PepperShaker - object
        Lettuce - object
        AlarmClockType - otype
        FootstoolType - otype
        TissueBoxType - otype
        SpatulaType - otype
        CandleType - otype
        BreadType - otype
        WateringCanType - otype
        KnifeType - otype
        AppleType - otype
        TeddyBearType - otype
        PaperTowelRollType - otype
        MugType - otype
        LadleType - otype
        StatueType - otype
        StoveKnobType - otype
        WatchType - otype
        CellPhoneType - otype
        CupType - otype
        TowelType - otype
        GlassbottleType - otype
        PlungerType - otype
        KettleType - otype
        ToiletPaperRollType - otype
        PlateType - otype
        DeskLampType - otype
        BookType - otype
        TelevisionType - otype
        BathtubType - otype
        PotatoType - otype
        PillowType - otype
        SoapBottleType - otype
        BoxType - otype
        NewspaperType - otype
        LightSwitchType - otype
        ButterKnifeType - otype
        RemoteControlType - otype
        LaptopType - otype
        ShowerGlassType - otype
        WineBottleType - otype
        SinkType - otype
        BlindsType - otype
        TennisRacketType - otype
        BasketBallType - otype
        VaseType - otype
        TomatoType - otype
        SpoonType - otype
        WindowType - otype
        EggType - otype
        CurtainsType - otype
        PencilType - otype
        ClothType - otype
        PaintingType - otype
        SprayBottleType - otype
        CDType - otype
        ScrubBrushType - otype
        PaperTowelType - otype
        MirrorType - otype
        BowlType - otype
        SaltShakerType - otype
        DishSpongeType - otype
        LaundryHamperLidType - otype
        PotType - otype
        CreditCardType - otype
        BaseballBatType - otype
        SoapBarType - otype
        KeyChainType - otype
        PenType - otype
        ForkType - otype
        ToasterType - otype
        PanType - otype
        HousePlantType - otype
        ChairType - otype
        ToiletPaperType - otype
        FloorLampType - otype
        HandTowelType - otype
        BootsType - otype
        PosterType - otype
        ShowerDoorType - otype
        PepperShakerType - otype
        LettuceType - otype
        DrawerType - rtype
        ArmChairType - rtype
        LaundryHamperType - rtype
        TowelHolderType - rtype
        MicrowaveType - rtype
        DeskType - rtype
        ShelfType - rtype
        CoffeeTableType - rtype
        BathtubBasinType - rtype
        SofaType - rtype
        StoveBurnerType - rtype
        CabinetType - rtype
        DiningTableType - rtype
        SinkBasinType - rtype
        GarbageCanType - rtype
        OttomanType - rtype
        BedType - rtype
        ToiletType - rtype
        FridgeType - rtype
        CartType - rtype
        SideTableType - rtype
        CounterTopType - rtype
        DresserType - rtype
        CoffeeMachineType - rtype
        ToiletPaperHangerType - rtype
        HandTowelHolderType - rtype
        SafeType - rtype


        KeyChain__minus_17_dot_916536_comma__minus_17_dot_916536_comma_13_dot_55398084_comma_13_dot_55398084_comma_2_dot_049388172_comma_2_dot_049388172 - object
        Drawer__minus_17_dot_733296_comma__minus_17_dot_733296_comma_13_dot_37799932_comma_13_dot_37799932_comma_1_dot_8938998_comma_1_dot_8938998 - receptacle
        ArmChair__minus_3_dot_504_comma__minus_3_dot_504_comma_2_dot_264_comma_2_dot_264_comma__minus_0_dot_1316_comma__minus_0_dot_1316 - receptacle
        Shelf__minus_1_dot_85999584_comma__minus_1_dot_85999584_comma_12_dot_15600204_comma_12_dot_15600204_comma_0_dot_6968_comma_0_dot_6968 - receptacle
        Shelf__minus_1_dot_346000672_comma__minus_1_dot_346000672_comma_10_dot_696_comma_10_dot_696_comma_0_dot_7032_comma_0_dot_7032 - receptacle
        Shelf__minus_1_dot_85999584_comma__minus_1_dot_85999584_comma_12_dot_15600204_comma_12_dot_15600204_comma_1_dot_6748_comma_1_dot_6748 - receptacle
        Shelf__minus_1_dot_846003892_comma__minus_1_dot_846003892_comma_9_dot_21560192_comma_9_dot_21560192_comma_1_dot_9108_comma_1_dot_9108 - receptacle
        Shelf__minus_1_dot_860004_comma__minus_1_dot_860004_comma_9_dot_21760176_comma_9_dot_21760176_comma_0_dot_7012_comma_0_dot_7012 - receptacle
        Shelf__minus_1_dot_85999584_comma__minus_1_dot_85999584_comma_12_dot_15600204_comma_12_dot_15600204_comma_2_dot_2752_comma_2_dot_2752 - receptacle
        CoffeeTable__minus_7_dot_892_comma__minus_7_dot_892_comma_10_dot_4616_comma_10_dot_4616_comma_0_dot_0084_comma_0_dot_0084 - receptacle
        Sofa__minus_8_dot_5_comma__minus_8_dot_5_comma_18_dot_232_comma_18_dot_232_comma__minus_0_dot_016_comma__minus_0_dot_016 - receptacle
        Sofa__minus_18_dot_28_comma__minus_18_dot_28_comma_7_dot_6_comma_7_dot_6_comma__minus_0_dot_016_comma__minus_0_dot_016 - receptacle
        SideTable__minus_18_dot_452_comma__minus_18_dot_452_comma_13_dot_3852_comma_13_dot_3852_comma_0_dot_024_comma_0_dot_024 - receptacle
        GarbageCan__minus_0_dot_90916252_comma__minus_0_dot_90916252_comma_19_dot_11539076_comma_19_dot_11539076_comma_0_dot_023272708_comma_0_dot_023272708 - receptacle
        loc_bar__minus_15_bar_9_bar_3_bar_60 - location
        loc_bar__minus_5_bar_10_bar_1_bar_60 - location
        loc_bar__minus_5_bar_13_bar_1_bar_60 - location
        loc_bar__minus_10_bar_13_bar_0_bar_45 - location
        loc_bar__minus_17_bar_17_bar_2_bar_60 - location
        loc_bar__minus_6_bar_8_bar_1_bar_45 - location
        loc_bar__minus_4_bar_7_bar_2_bar_60 - location
        loc_bar__minus_14_bar_11_bar_3_bar_45 - location
        loc_bar__minus_6_bar_14_bar_1_bar_45 - location
        loc_bar__minus_4_bar_11_bar_3_bar_60 - location
        loc_bar__minus_13_bar_8_bar_3_bar_45 - location
        loc_bar__minus_16_bar_14_bar_3_bar_60 - location
        loc_bar__minus_1_bar_17_bar_0_bar_60 - location
        loc_bar__minus_6_bar_14_bar_1_bar_60 - location
        loc_bar__minus_8_bar_14_bar_2_bar_60 - location
        loc_bar__minus_6_bar_7_bar_1_bar_60 - location
        loc_bar__minus_7_bar_14_bar_3_bar_30 - location
        )


    (:init
        (= (totalCost) 0)
        (canContain ShelfType TissueBoxType)
        (canContain ShelfType AlarmClockType)
        (canContain ShelfType CandleType)
        (canContain ShelfType WateringCanType)
        (canContain ShelfType MugType)
        (canContain ShelfType StatueType)
        (canContain ShelfType WatchType)
        (canContain ShelfType CellPhoneType)
        (canContain ShelfType CupType)
        (canContain ShelfType GlassbottleType)
        (canContain ShelfType KettleType)
        (canContain ShelfType ToiletPaperRollType)
        (canContain ShelfType PlateType)
        (canContain ShelfType BookType)
        (canContain ShelfType SoapBottleType)
        (canContain ShelfType BoxType)
        (canContain ShelfType NewspaperType)
        (canContain ShelfType RemoteControlType)
        (canContain ShelfType WineBottleType)
        (canContain ShelfType VaseType)
        (canContain ShelfType CDType)
        (canContain ShelfType ClothType)
        (canContain ShelfType PencilType)
        (canContain ShelfType SprayBottleType)
        (canContain ShelfType SoapBarType)
        (canContain ShelfType PaperTowelType)
        (canContain ShelfType BowlType)
        (canContain ShelfType SaltShakerType)
        (canContain ShelfType DishSpongeType)
        (canContain ShelfType CreditCardType)
        (canContain ShelfType PotType)
        (canContain ShelfType KeyChainType)
        (canContain ShelfType PenType)
        (canContain ShelfType ToiletPaperType)
        (canContain ShelfType HandTowelType)
        (canContain ShelfType PepperShakerType)
        (canContain DrawerType TissueBoxType)
        (canContain DrawerType SpatulaType)
        (canContain DrawerType CandleType)
        (canContain DrawerType WateringCanType)
        (canContain DrawerType KnifeType)
        (canContain DrawerType LadleType)
        (canContain DrawerType WatchType)
        (canContain DrawerType CellPhoneType)
        (canContain DrawerType ToiletPaperRollType)
        (canContain DrawerType BookType)
        (canContain DrawerType SoapBottleType)
        (canContain DrawerType NewspaperType)
        (canContain DrawerType ButterKnifeType)
        (canContain DrawerType RemoteControlType)
        (canContain DrawerType SpoonType)
        (canContain DrawerType CDType)
        (canContain DrawerType ClothType)
        (canContain DrawerType PencilType)
        (canContain DrawerType SprayBottleType)
        (canContain DrawerType SoapBarType)
        (canContain DrawerType SaltShakerType)
        (canContain DrawerType DishSpongeType)
        (canContain DrawerType CreditCardType)
        (canContain DrawerType KeyChainType)
        (canContain DrawerType PenType)
        (canContain DrawerType ForkType)
        (canContain DrawerType ToiletPaperType)
        (canContain DrawerType HandTowelType)
        (canContain DrawerType PepperShakerType)
        (canContain ArmChairType RemoteControlType)
        (canContain ArmChairType LaptopType)
        (canContain ArmChairType BasketBallType)
        (canContain ArmChairType CreditCardType)
        (canContain ArmChairType ClothType)
        (canContain ArmChairType BookType)
        (canContain ArmChairType PillowType)
        (canContain ArmChairType BoxType)
        (canContain ArmChairType NewspaperType)
        (canContain ArmChairType CellPhoneType)
        (canContain ArmChairType KeyChainType)
        (canContain BedType LaptopType)
        (canContain BedType BasketBallType)
        (canContain BedType TennisRacketType)
        (canContain BedType BookType)
        (canContain BedType PillowType)
        (canContain BedType NewspaperType)
        (canContain BedType BaseballBatType)
        (canContain BedType CellPhoneType)
        (canContain ToiletType TissueBoxType)
        (canContain ToiletType CandleType)
        (canContain ToiletType ToiletPaperRollType)
        (canContain ToiletType ClothType)
        (canContain ToiletType ToiletPaperType)
        (canContain ToiletType SprayBottleType)
        (canContain ToiletType SoapBarType)
        (canContain ToiletType PaperTowelType)
        (canContain ToiletType SoapBottleType)
        (canContain ToiletType HandTowelType)
        (canContain ToiletType DishSpongeType)
        (canContain ToiletType NewspaperType)
        (canContain MicrowaveType CupType)
        (canContain MicrowaveType GlassbottleType)
        (canContain MicrowaveType BreadType)
        (canContain MicrowaveType TomatoType)
        (canContain MicrowaveType PlateType)
        (canContain MicrowaveType AppleType)
        (canContain MicrowaveType EggType)
        (canContain MicrowaveType MugType)
        (canContain MicrowaveType PotatoType)
        (canContain MicrowaveType BowlType)
        (canContain DeskType TissueBoxType)
        (canContain DeskType AlarmClockType)
        (canContain DeskType CandleType)
        (canContain DeskType WateringCanType)
        (canContain DeskType MugType)
        (canContain DeskType StatueType)
        (canContain DeskType WatchType)
        (canContain DeskType CellPhoneType)
        (canContain DeskType CupType)
        (canContain DeskType GlassbottleType)
        (canContain DeskType ToiletPaperRollType)
        (canContain DeskType PlateType)
        (canContain DeskType BookType)
        (canContain DeskType SoapBottleType)
        (canContain DeskType BoxType)
        (canContain DeskType NewspaperType)
        (canContain DeskType RemoteControlType)
        (canContain DeskType LaptopType)
        (canContain DeskType WineBottleType)
        (canContain DeskType BasketBallType)
        (canContain DeskType TennisRacketType)
        (canContain DeskType VaseType)
        (canContain DeskType CDType)
        (canContain DeskType ClothType)
        (canContain DeskType PencilType)
        (canContain DeskType SprayBottleType)
        (canContain DeskType BowlType)
        (canContain DeskType CreditCardType)
        (canContain DeskType KeyChainType)
        (canContain DeskType PenType)
        (canContain DeskType ToiletPaperType)
        (canContain LaundryHamperType ClothType)
        (canContain FridgeType CupType)
        (canContain FridgeType GlassbottleType)
        (canContain FridgeType WineBottleType)
        (canContain FridgeType PanType)
        (canContain FridgeType TomatoType)
        (canContain FridgeType PlateType)
        (canContain FridgeType BreadType)
        (canContain FridgeType EggType)
        (canContain FridgeType AppleType)
        (canContain FridgeType MugType)
        (canContain FridgeType PotatoType)
        (canContain FridgeType BowlType)
        (canContain FridgeType PotType)
        (canContain FridgeType LettuceType)
        (canContain CoffeeTableType TissueBoxType)
        (canContain CoffeeTableType AlarmClockType)
        (canContain CoffeeTableType SpatulaType)
        (canContain CoffeeTableType CandleType)
        (canContain CoffeeTableType BreadType)
        (canContain CoffeeTableType WateringCanType)
        (canContain CoffeeTableType KnifeType)
        (canContain CoffeeTableType MugType)
        (canContain CoffeeTableType StatueType)
        (canContain CoffeeTableType LadleType)
        (canContain CoffeeTableType WatchType)
        (canContain CoffeeTableType CellPhoneType)
        (canContain CoffeeTableType CupType)
        (canContain CoffeeTableType GlassbottleType)
        (canContain CoffeeTableType KettleType)
        (canContain CoffeeTableType ToiletPaperRollType)
        (canContain CoffeeTableType PlateType)
        (canContain CoffeeTableType BookType)
        (canContain CoffeeTableType PotatoType)
        (canContain CoffeeTableType SoapBottleType)
        (canContain CoffeeTableType BoxType)
        (canContain CoffeeTableType NewspaperType)
        (canContain CoffeeTableType ButterKnifeType)
        (canContain CoffeeTableType RemoteControlType)
        (canContain CoffeeTableType LaptopType)
        (canContain CoffeeTableType WineBottleType)
        (canContain CoffeeTableType BasketBallType)
        (canContain CoffeeTableType TennisRacketType)
        (canContain CoffeeTableType VaseType)
        (canContain CoffeeTableType TomatoType)
        (canContain CoffeeTableType SpoonType)
        (canContain CoffeeTableType EggType)
        (canContain CoffeeTableType CDType)
        (canContain CoffeeTableType PencilType)
        (canContain CoffeeTableType SprayBottleType)
        (canContain CoffeeTableType ClothType)
        (canContain CoffeeTableType SoapBarType)
        (canContain CoffeeTableType PaperTowelType)
        (canContain CoffeeTableType BowlType)
        (canContain CoffeeTableType SaltShakerType)
        (canContain CoffeeTableType DishSpongeType)
        (canContain CoffeeTableType CreditCardType)
        (canContain CoffeeTableType PotType)
        (canContain CoffeeTableType BaseballBatType)
        (canContain CoffeeTableType KeyChainType)
        (canContain CoffeeTableType PenType)
        (canContain CoffeeTableType ForkType)
        (canContain CoffeeTableType PanType)
        (canContain CoffeeTableType ToiletPaperType)
        (canContain CoffeeTableType HandTowelType)
        (canContain CoffeeTableType AppleType)
        (canContain CoffeeTableType PepperShakerType)
        (canContain CoffeeTableType LettuceType)
        (canContain TowelHolderType TowelType)
        (canContain CartType TissueBoxType)
        (canContain CartType PlungerType)
        (canContain CartType VaseType)
        (canContain CartType ToiletPaperRollType)
        (canContain CartType CandleType)
        (canContain CartType ClothType)
        (canContain CartType ToiletPaperType)
        (canContain CartType SprayBottleType)
        (canContain CartType MugType)
        (canContain CartType SoapBarType)
        (canContain CartType PaperTowelType)
        (canContain CartType HandTowelType)
        (canContain CartType StatueType)
        (canContain CartType SoapBottleType)
        (canContain CartType DishSpongeType)
        (canContain DresserType TissueBoxType)
        (canContain DresserType AlarmClockType)
        (canContain DresserType CandleType)
        (canContain DresserType WateringCanType)
        (canContain DresserType MugType)
        (canContain DresserType StatueType)
        (canContain DresserType WatchType)
        (canContain DresserType CellPhoneType)
        (canContain DresserType CupType)
        (canContain DresserType GlassbottleType)
        (canContain DresserType ToiletPaperRollType)
        (canContain DresserType PlateType)
        (canContain DresserType BookType)
        (canContain DresserType BoxType)
        (canContain DresserType NewspaperType)
        (canContain DresserType RemoteControlType)
        (canContain DresserType LaptopType)
        (canContain DresserType WineBottleType)
        (canContain DresserType BasketBallType)
        (canContain DresserType TennisRacketType)
        (canContain DresserType VaseType)
        (canContain DresserType CDType)
        (canContain DresserType ClothType)
        (canContain DresserType PencilType)
        (canContain DresserType SprayBottleType)
        (canContain DresserType BowlType)
        (canContain DresserType CreditCardType)
        (canContain DresserType KeyChainType)
        (canContain DresserType PenType)
        (canContain DresserType ToiletPaperType)
        (canContain BathtubBasinType DishSpongeType)
        (canContain BathtubBasinType SoapBarType)
        (canContain BathtubBasinType HandTowelType)
        (canContain BathtubBasinType ClothType)
        (canContain SideTableType TissueBoxType)
        (canContain SideTableType AlarmClockType)
        (canContain SideTableType SpatulaType)
        (canContain SideTableType CandleType)
        (canContain SideTableType BreadType)
        (canContain SideTableType WateringCanType)
        (canContain SideTableType KnifeType)
        (canContain SideTableType MugType)
        (canContain SideTableType StatueType)
        (canContain SideTableType LadleType)
        (canContain SideTableType WatchType)
        (canContain SideTableType CellPhoneType)
        (canContain SideTableType CupType)
        (canContain SideTableType GlassbottleType)
        (canContain SideTableType KettleType)
        (canContain SideTableType ToiletPaperRollType)
        (canContain SideTableType PlateType)
        (canContain SideTableType BookType)
        (canContain SideTableType PotatoType)
        (canContain SideTableType SoapBottleType)
        (canContain SideTableType BoxType)
        (canContain SideTableType NewspaperType)
        (canContain SideTableType ButterKnifeType)
        (canContain SideTableType RemoteControlType)
        (canContain SideTableType LaptopType)
        (canContain SideTableType WineBottleType)
        (canContain SideTableType BasketBallType)
        (canContain SideTableType TennisRacketType)
        (canContain SideTableType VaseType)
        (canContain SideTableType TomatoType)
        (canContain SideTableType SpoonType)
        (canContain SideTableType EggType)
        (canContain SideTableType CDType)
        (canContain SideTableType PencilType)
        (canContain SideTableType SprayBottleType)
        (canContain SideTableType ClothType)
        (canContain SideTableType SoapBarType)
        (canContain SideTableType PaperTowelType)
        (canContain SideTableType BowlType)
        (canContain SideTableType SaltShakerType)
        (canContain SideTableType DishSpongeType)
        (canContain SideTableType CreditCardType)
        (canContain SideTableType PotType)
        (canContain SideTableType BaseballBatType)
        (canContain SideTableType KeyChainType)
        (canContain SideTableType PenType)
        (canContain SideTableType ForkType)
        (canContain SideTableType PanType)
        (canContain SideTableType ToiletPaperType)
        (canContain SideTableType HandTowelType)
        (canContain SideTableType AppleType)
        (canContain SideTableType PepperShakerType)
        (canContain SideTableType LettuceType)
        (canContain OttomanType RemoteControlType)
        (canContain OttomanType LaptopType)
        (canContain OttomanType BasketBallType)
        (canContain OttomanType CreditCardType)
        (canContain OttomanType ClothType)
        (canContain OttomanType BookType)
        (canContain OttomanType PillowType)
        (canContain OttomanType BoxType)
        (canContain OttomanType NewspaperType)
        (canContain OttomanType CellPhoneType)
        (canContain OttomanType KeyChainType)
        (canContain DiningTableType TissueBoxType)
        (canContain DiningTableType AlarmClockType)
        (canContain DiningTableType SpatulaType)
        (canContain DiningTableType CandleType)
        (canContain DiningTableType BreadType)
        (canContain DiningTableType WateringCanType)
        (canContain DiningTableType KnifeType)
        (canContain DiningTableType MugType)
        (canContain DiningTableType StatueType)
        (canContain DiningTableType LadleType)
        (canContain DiningTableType WatchType)
        (canContain DiningTableType CellPhoneType)
        (canContain DiningTableType CupType)
        (canContain DiningTableType GlassbottleType)
        (canContain DiningTableType KettleType)
        (canContain DiningTableType ToiletPaperRollType)
        (canContain DiningTableType PlateType)
        (canContain DiningTableType BookType)
        (canContain DiningTableType PotatoType)
        (canContain DiningTableType SoapBottleType)
        (canContain DiningTableType BoxType)
        (canContain DiningTableType NewspaperType)
        (canContain DiningTableType ButterKnifeType)
        (canContain DiningTableType RemoteControlType)
        (canContain DiningTableType LaptopType)
        (canContain DiningTableType WineBottleType)
        (canContain DiningTableType BasketBallType)
        (canContain DiningTableType TennisRacketType)
        (canContain DiningTableType VaseType)
        (canContain DiningTableType TomatoType)
        (canContain DiningTableType SpoonType)
        (canContain DiningTableType EggType)
        (canContain DiningTableType CDType)
        (canContain DiningTableType PencilType)
        (canContain DiningTableType SprayBottleType)
        (canContain DiningTableType ClothType)
        (canContain DiningTableType SoapBarType)
        (canContain DiningTableType PaperTowelType)
        (canContain DiningTableType BowlType)
        (canContain DiningTableType SaltShakerType)
        (canContain DiningTableType DishSpongeType)
        (canContain DiningTableType CreditCardType)
        (canContain DiningTableType PotType)
        (canContain DiningTableType BaseballBatType)
        (canContain DiningTableType KeyChainType)
        (canContain DiningTableType PenType)
        (canContain DiningTableType ForkType)
        (canContain DiningTableType PanType)
        (canContain DiningTableType ToiletPaperType)
        (canContain DiningTableType HandTowelType)
        (canContain DiningTableType AppleType)
        (canContain DiningTableType PepperShakerType)
        (canContain DiningTableType LettuceType)
        (canContain CounterTopType TissueBoxType)
        (canContain CounterTopType AlarmClockType)
        (canContain CounterTopType SpatulaType)
        (canContain CounterTopType CandleType)
        (canContain CounterTopType BreadType)
        (canContain CounterTopType WateringCanType)
        (canContain CounterTopType KnifeType)
        (canContain CounterTopType MugType)
        (canContain CounterTopType StatueType)
        (canContain CounterTopType LadleType)
        (canContain CounterTopType WatchType)
        (canContain CounterTopType CellPhoneType)
        (canContain CounterTopType CupType)
        (canContain CounterTopType GlassbottleType)
        (canContain CounterTopType KettleType)
        (canContain CounterTopType ToiletPaperRollType)
        (canContain CounterTopType PlateType)
        (canContain CounterTopType BookType)
        (canContain CounterTopType PotatoType)
        (canContain CounterTopType SoapBottleType)
        (canContain CounterTopType BoxType)
        (canContain CounterTopType NewspaperType)
        (canContain CounterTopType ButterKnifeType)
        (canContain CounterTopType RemoteControlType)
        (canContain CounterTopType LaptopType)
        (canContain CounterTopType WineBottleType)
        (canContain CounterTopType BasketBallType)
        (canContain CounterTopType TennisRacketType)
        (canContain CounterTopType VaseType)
        (canContain CounterTopType TomatoType)
        (canContain CounterTopType SpoonType)
        (canContain CounterTopType EggType)
        (canContain CounterTopType CDType)
        (canContain CounterTopType PencilType)
        (canContain CounterTopType SprayBottleType)
        (canContain CounterTopType ClothType)
        (canContain CounterTopType SoapBarType)
        (canContain CounterTopType PaperTowelType)
        (canContain CounterTopType BowlType)
        (canContain CounterTopType SaltShakerType)
        (canContain CounterTopType DishSpongeType)
        (canContain CounterTopType CreditCardType)
        (canContain CounterTopType PotType)
        (canContain CounterTopType BaseballBatType)
        (canContain CounterTopType KeyChainType)
        (canContain CounterTopType PenType)
        (canContain CounterTopType ForkType)
        (canContain CounterTopType PanType)
        (canContain CounterTopType ToiletPaperType)
        (canContain CounterTopType HandTowelType)
        (canContain CounterTopType AppleType)
        (canContain CounterTopType PepperShakerType)
        (canContain CounterTopType LettuceType)
        (canContain StoveBurnerType PanType)
        (canContain StoveBurnerType PotType)
        (canContain StoveBurnerType KettleType)
        (canContain CoffeeMachineType MugType)
        (canContain ToiletPaperHangerType ToiletPaperType)
        (canContain ToiletPaperHangerType ToiletPaperRollType)
        (canContain HandTowelHolderType HandTowelType)
        (canContain CabinetType TissueBoxType)
        (canContain CabinetType CandleType)
        (canContain CabinetType WateringCanType)
        (canContain CabinetType MugType)
        (canContain CabinetType LadleType)
        (canContain CabinetType CupType)
        (canContain CabinetType GlassbottleType)
        (canContain CabinetType PlungerType)
        (canContain CabinetType KettleType)
        (canContain CabinetType ToiletPaperRollType)
        (canContain CabinetType PlateType)
        (canContain CabinetType BookType)
        (canContain CabinetType SoapBottleType)
        (canContain CabinetType BoxType)
        (canContain CabinetType NewspaperType)
        (canContain CabinetType WineBottleType)
        (canContain CabinetType VaseType)
        (canContain CabinetType CDType)
        (canContain CabinetType ClothType)
        (canContain CabinetType SprayBottleType)
        (canContain CabinetType SoapBarType)
        (canContain CabinetType BowlType)
        (canContain CabinetType SaltShakerType)
        (canContain CabinetType DishSpongeType)
        (canContain CabinetType PotType)
        (canContain CabinetType PanType)
        (canContain CabinetType ToiletPaperType)
        (canContain CabinetType HandTowelType)
        (canContain CabinetType PepperShakerType)
        (canContain SafeType VaseType)
        (canContain SafeType CDType)
        (canContain SafeType StatueType)
        (canContain SafeType WatchType)
        (canContain SafeType CreditCardType)
        (canContain SafeType CellPhoneType)
        (canContain SafeType KeyChainType)
        (canContain SinkBasinType SpatulaType)
        (canContain SinkBasinType KnifeType)
        (canContain SinkBasinType MugType)
        (canContain SinkBasinType LadleType)
        (canContain SinkBasinType CupType)
        (canContain SinkBasinType GlassbottleType)
        (canContain SinkBasinType KettleType)
        (canContain SinkBasinType PlateType)
        (canContain SinkBasinType PotatoType)
        (canContain SinkBasinType ButterKnifeType)
        (canContain SinkBasinType TomatoType)
        (canContain SinkBasinType SpoonType)
        (canContain SinkBasinType EggType)
        (canContain SinkBasinType ClothType)
        (canContain SinkBasinType SoapBarType)
        (canContain SinkBasinType BowlType)
        (canContain SinkBasinType DishSpongeType)
        (canContain SinkBasinType PotType)
        (canContain SinkBasinType ForkType)
        (canContain SinkBasinType PanType)
        (canContain SinkBasinType HandTowelType)
        (canContain SinkBasinType AppleType)
        (canContain SinkBasinType LettuceType)
        (canContain GarbageCanType TissueBoxType)
        (canContain GarbageCanType BreadType)
        (canContain GarbageCanType ToiletPaperRollType)
        (canContain GarbageCanType PotatoType)
        (canContain GarbageCanType SoapBottleType)
        (canContain GarbageCanType NewspaperType)
        (canContain GarbageCanType WineBottleType)
        (canContain GarbageCanType TomatoType)
        (canContain GarbageCanType EggType)
        (canContain GarbageCanType CDType)
        (canContain GarbageCanType PencilType)
        (canContain GarbageCanType SprayBottleType)
        (canContain GarbageCanType ClothType)
        (canContain GarbageCanType SoapBarType)
        (canContain GarbageCanType PaperTowelType)
        (canContain GarbageCanType DishSpongeType)
        (canContain GarbageCanType PenType)
        (canContain GarbageCanType ToiletPaperType)
        (canContain GarbageCanType HandTowelType)
        (canContain GarbageCanType AppleType)
        (canContain GarbageCanType LettuceType)


        (receptacleType Drawer__minus_17_dot_733296_comma__minus_17_dot_733296_comma_13_dot_37799932_comma_13_dot_37799932_comma_1_dot_8938998_comma_1_dot_8938998 DrawerType)
        (receptacleType ArmChair__minus_3_dot_504_comma__minus_3_dot_504_comma_2_dot_264_comma_2_dot_264_comma__minus_0_dot_1316_comma__minus_0_dot_1316 ArmChairType)
        (receptacleType Shelf__minus_1_dot_85999584_comma__minus_1_dot_85999584_comma_12_dot_15600204_comma_12_dot_15600204_comma_0_dot_6968_comma_0_dot_6968 ShelfType)
        (receptacleType Shelf__minus_1_dot_346000672_comma__minus_1_dot_346000672_comma_10_dot_696_comma_10_dot_696_comma_0_dot_7032_comma_0_dot_7032 ShelfType)
        (receptacleType Shelf__minus_1_dot_85999584_comma__minus_1_dot_85999584_comma_12_dot_15600204_comma_12_dot_15600204_comma_1_dot_6748_comma_1_dot_6748 ShelfType)
        (receptacleType Shelf__minus_1_dot_846003892_comma__minus_1_dot_846003892_comma_9_dot_21560192_comma_9_dot_21560192_comma_1_dot_9108_comma_1_dot_9108 ShelfType)
        (receptacleType Shelf__minus_1_dot_860004_comma__minus_1_dot_860004_comma_9_dot_21760176_comma_9_dot_21760176_comma_0_dot_7012_comma_0_dot_7012 ShelfType)
        (receptacleType Shelf__minus_1_dot_85999584_comma__minus_1_dot_85999584_comma_12_dot_15600204_comma_12_dot_15600204_comma_2_dot_2752_comma_2_dot_2752 ShelfType)
        (receptacleType CoffeeTable__minus_7_dot_892_comma__minus_7_dot_892_comma_10_dot_4616_comma_10_dot_4616_comma_0_dot_0084_comma_0_dot_0084 CoffeeTableType)
        (receptacleType Sofa__minus_8_dot_5_comma__minus_8_dot_5_comma_18_dot_232_comma_18_dot_232_comma__minus_0_dot_016_comma__minus_0_dot_016 SofaType)
        (receptacleType Sofa__minus_18_dot_28_comma__minus_18_dot_28_comma_7_dot_6_comma_7_dot_6_comma__minus_0_dot_016_comma__minus_0_dot_016 SofaType)
        (receptacleType SideTable__minus_18_dot_452_comma__minus_18_dot_452_comma_13_dot_3852_comma_13_dot_3852_comma_0_dot_024_comma_0_dot_024 SideTableType)
        (receptacleType GarbageCan__minus_0_dot_90916252_comma__minus_0_dot_90916252_comma_19_dot_11539076_comma_19_dot_11539076_comma_0_dot_023272708_comma_0_dot_023272708 GarbageCanType)
        (objectType KeyChain__minus_17_dot_916536_comma__minus_17_dot_916536_comma_13_dot_55398084_comma_13_dot_55398084_comma_2_dot_049388172_comma_2_dot_049388172 KeyChainType)
        
        (openable Drawer__minus_17_dot_733296_comma__minus_17_dot_733296_comma_13_dot_37799932_comma_13_dot_37799932_comma_1_dot_8938998_comma_1_dot_8938998)
        
        (atLocation agent1 loc_bar__minus_7_bar_14_bar_3_bar_30)
        
        
        
        
        
        
        
        
        
        
        
        
        (inReceptacle KeyChain__minus_17_dot_916536_comma__minus_17_dot_916536_comma_13_dot_55398084_comma_13_dot_55398084_comma_2_dot_049388172_comma_2_dot_049388172 SideTable__minus_18_dot_452_comma__minus_18_dot_452_comma_13_dot_3852_comma_13_dot_3852_comma_0_dot_024_comma_0_dot_024)
        (wasInReceptacle  KeyChain__minus_17_dot_916536_comma__minus_17_dot_916536_comma_13_dot_55398084_comma_13_dot_55398084_comma_2_dot_049388172_comma_2_dot_049388172 SideTable__minus_18_dot_452_comma__minus_18_dot_452_comma_13_dot_3852_comma_13_dot_3852_comma_0_dot_024_comma_0_dot_024)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_6_bar_8_bar_1_bar_45) 13)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_10_bar_13_bar_0_bar_45) 13)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_14_bar_11_bar_3_bar_45) 10)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_10_bar_13_bar_0_bar_45) 10)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_4_bar_11_bar_3_bar_60) 13)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_10_bar_13_bar_0_bar_45) 13)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_13_bar_8_bar_3_bar_45) 12)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_10_bar_13_bar_0_bar_45) 12)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_7_bar_14_bar_3_bar_30) 9)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_10_bar_13_bar_0_bar_45) 9)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_1_bar_17_bar_0_bar_60) 17)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_10_bar_13_bar_0_bar_45) 17)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_4_bar_7_bar_2_bar_60) 16)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_10_bar_13_bar_0_bar_45) 16)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_8_bar_14_bar_2_bar_60) 7)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_10_bar_13_bar_0_bar_45) 7)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_15_bar_9_bar_3_bar_60) 14)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_10_bar_13_bar_0_bar_45) 14)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_5_bar_10_bar_1_bar_60) 13)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_10_bar_13_bar_0_bar_45) 13)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_5_bar_13_bar_1_bar_60) 8)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_10_bar_13_bar_0_bar_45) 8)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_17_bar_17_bar_2_bar_60) 15)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_10_bar_13_bar_0_bar_45) 15)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_6_bar_14_bar_1_bar_45) 7)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_10_bar_13_bar_0_bar_45) 7)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_16_bar_14_bar_3_bar_60) 10)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_10_bar_13_bar_0_bar_45) 10)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_6_bar_14_bar_1_bar_60) 8)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_10_bar_13_bar_0_bar_45) 8)
        (= (distance loc_bar__minus_10_bar_13_bar_0_bar_45 loc_bar__minus_6_bar_7_bar_1_bar_60) 15)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_10_bar_13_bar_0_bar_45) 15)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_14_bar_11_bar_3_bar_45) 14)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_6_bar_8_bar_1_bar_45) 14)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_4_bar_11_bar_3_bar_60) 9)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_6_bar_8_bar_1_bar_45) 9)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_13_bar_8_bar_3_bar_45) 10)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_6_bar_8_bar_1_bar_45) 10)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_7_bar_14_bar_3_bar_30) 11)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_6_bar_8_bar_1_bar_45) 11)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_1_bar_17_bar_0_bar_60) 17)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_6_bar_8_bar_1_bar_45) 17)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_4_bar_7_bar_2_bar_60) 6)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_6_bar_8_bar_1_bar_45) 6)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_8_bar_14_bar_2_bar_60) 13)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_6_bar_8_bar_1_bar_45) 13)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_15_bar_9_bar_3_bar_60) 14)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_6_bar_8_bar_1_bar_45) 14)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_5_bar_10_bar_1_bar_60) 7)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_6_bar_8_bar_1_bar_45) 7)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_5_bar_13_bar_1_bar_60) 10)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_6_bar_8_bar_1_bar_45) 10)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_17_bar_17_bar_2_bar_60) 25)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_6_bar_8_bar_1_bar_45) 25)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_6_bar_14_bar_1_bar_45) 9)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_6_bar_8_bar_1_bar_45) 9)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_16_bar_14_bar_3_bar_60) 20)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_6_bar_8_bar_1_bar_45) 20)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_6_bar_14_bar_1_bar_60) 10)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_6_bar_8_bar_1_bar_45) 10)
        (= (distance loc_bar__minus_6_bar_8_bar_1_bar_45 loc_bar__minus_6_bar_7_bar_1_bar_60) 5)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_6_bar_8_bar_1_bar_45) 5)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_4_bar_11_bar_3_bar_60) 16)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_14_bar_11_bar_3_bar_45) 16)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_13_bar_8_bar_3_bar_45) 9)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_14_bar_11_bar_3_bar_45) 9)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_7_bar_14_bar_3_bar_30) 16)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_14_bar_11_bar_3_bar_45) 16)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_1_bar_17_bar_0_bar_60) 24)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_14_bar_11_bar_3_bar_45) 24)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_4_bar_7_bar_2_bar_60) 19)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_14_bar_11_bar_3_bar_45) 19)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_8_bar_14_bar_2_bar_60) 14)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_14_bar_11_bar_3_bar_45) 14)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_15_bar_9_bar_3_bar_60) 7)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_14_bar_11_bar_3_bar_45) 7)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_5_bar_10_bar_1_bar_60) 14)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_14_bar_11_bar_3_bar_45) 14)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_5_bar_13_bar_1_bar_60) 15)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_14_bar_11_bar_3_bar_45) 15)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_17_bar_17_bar_2_bar_60) 14)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_14_bar_11_bar_3_bar_45) 14)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_6_bar_14_bar_1_bar_45) 14)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_14_bar_11_bar_3_bar_45) 14)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_16_bar_14_bar_3_bar_60) 9)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_14_bar_11_bar_3_bar_45) 9)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_6_bar_14_bar_1_bar_60) 15)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_14_bar_11_bar_3_bar_45) 15)
        (= (distance loc_bar__minus_14_bar_11_bar_3_bar_45 loc_bar__minus_6_bar_7_bar_1_bar_60) 16)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_14_bar_11_bar_3_bar_45) 16)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_13_bar_8_bar_3_bar_45) 16)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_4_bar_11_bar_3_bar_60) 16)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_7_bar_14_bar_3_bar_30) 11)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_4_bar_11_bar_3_bar_60) 11)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_1_bar_17_bar_0_bar_60) 13)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_4_bar_11_bar_3_bar_60) 13)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_4_bar_7_bar_2_bar_60) 6)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_4_bar_11_bar_3_bar_60) 6)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_8_bar_14_bar_2_bar_60) 11)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_4_bar_11_bar_3_bar_60) 11)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_15_bar_9_bar_3_bar_60) 16)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_4_bar_11_bar_3_bar_60) 16)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_5_bar_10_bar_1_bar_60) 5)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_4_bar_11_bar_3_bar_60) 5)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_5_bar_13_bar_1_bar_60) 6)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_4_bar_11_bar_3_bar_60) 6)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_17_bar_17_bar_2_bar_60) 23)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_4_bar_11_bar_3_bar_60) 23)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_45) 9)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_4_bar_11_bar_3_bar_60) 9)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_16_bar_14_bar_3_bar_60) 18)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_4_bar_11_bar_3_bar_60) 18)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_60) 8)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_4_bar_11_bar_3_bar_60) 8)
        (= (distance loc_bar__minus_4_bar_11_bar_3_bar_60 loc_bar__minus_6_bar_7_bar_1_bar_60) 9)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_4_bar_11_bar_3_bar_60) 9)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_7_bar_14_bar_3_bar_30) 18)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_13_bar_8_bar_3_bar_45) 18)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_1_bar_17_bar_0_bar_60) 26)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_13_bar_8_bar_3_bar_45) 26)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_4_bar_7_bar_2_bar_60) 15)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_13_bar_8_bar_3_bar_45) 15)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_8_bar_14_bar_2_bar_60) 16)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_13_bar_8_bar_3_bar_45) 16)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_15_bar_9_bar_3_bar_60) 7)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_13_bar_8_bar_3_bar_45) 7)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_5_bar_10_bar_1_bar_60) 14)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_13_bar_8_bar_3_bar_45) 14)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_5_bar_13_bar_1_bar_60) 17)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_13_bar_8_bar_3_bar_45) 17)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_17_bar_17_bar_2_bar_60) 18)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_13_bar_8_bar_3_bar_45) 18)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_6_bar_14_bar_1_bar_45) 16)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_13_bar_8_bar_3_bar_45) 16)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_16_bar_14_bar_3_bar_60) 13)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_13_bar_8_bar_3_bar_45) 13)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_6_bar_14_bar_1_bar_60) 17)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_13_bar_8_bar_3_bar_45) 17)
        (= (distance loc_bar__minus_13_bar_8_bar_3_bar_45 loc_bar__minus_6_bar_7_bar_1_bar_60) 12)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_13_bar_8_bar_3_bar_45) 12)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_1_bar_17_bar_0_bar_60) 15)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_7_bar_14_bar_3_bar_30) 15)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_4_bar_7_bar_2_bar_60) 16)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_7_bar_14_bar_3_bar_30) 16)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_8_bar_14_bar_2_bar_60) 5)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_7_bar_14_bar_3_bar_30) 5)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_15_bar_9_bar_3_bar_60) 18)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_7_bar_14_bar_3_bar_30) 18)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_5_bar_10_bar_1_bar_60) 11)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_7_bar_14_bar_3_bar_30) 11)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_5_bar_13_bar_1_bar_60) 8)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_7_bar_14_bar_3_bar_30) 8)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_17_bar_17_bar_2_bar_60) 19)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_7_bar_14_bar_3_bar_30) 19)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_6_bar_14_bar_1_bar_45) 5)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_7_bar_14_bar_3_bar_30) 5)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_16_bar_14_bar_3_bar_60) 12)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_7_bar_14_bar_3_bar_30) 12)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_6_bar_14_bar_1_bar_60) 6)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_7_bar_14_bar_3_bar_30) 6)
        (= (distance loc_bar__minus_7_bar_14_bar_3_bar_30 loc_bar__minus_6_bar_7_bar_1_bar_60) 13)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_7_bar_14_bar_3_bar_30) 13)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_4_bar_7_bar_2_bar_60) 16)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_1_bar_17_bar_0_bar_60) 16)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_8_bar_14_bar_2_bar_60) 13)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_1_bar_17_bar_0_bar_60) 13)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_15_bar_9_bar_3_bar_60) 26)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_1_bar_17_bar_0_bar_60) 26)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_5_bar_10_bar_1_bar_60) 15)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_1_bar_17_bar_0_bar_60) 15)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_5_bar_13_bar_1_bar_60) 12)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_1_bar_17_bar_0_bar_60) 12)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_17_bar_17_bar_2_bar_60) 19)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_1_bar_17_bar_0_bar_60) 19)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_45) 13)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_1_bar_17_bar_0_bar_60) 13)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_16_bar_14_bar_3_bar_60) 22)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_1_bar_17_bar_0_bar_60) 22)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_60) 12)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_1_bar_17_bar_0_bar_60) 12)
        (= (distance loc_bar__minus_1_bar_17_bar_0_bar_60 loc_bar__minus_6_bar_7_bar_1_bar_60) 19)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_1_bar_17_bar_0_bar_60) 19)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_8_bar_14_bar_2_bar_60) 16)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_4_bar_7_bar_2_bar_60) 16)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_15_bar_9_bar_3_bar_60) 17)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_4_bar_7_bar_2_bar_60) 17)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_5_bar_10_bar_1_bar_60) 8)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_4_bar_7_bar_2_bar_60) 8)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_5_bar_13_bar_1_bar_60) 11)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_4_bar_7_bar_2_bar_60) 11)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_17_bar_17_bar_2_bar_60) 28)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_4_bar_7_bar_2_bar_60) 28)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_45) 14)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_4_bar_7_bar_2_bar_60) 14)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_16_bar_14_bar_3_bar_60) 23)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_4_bar_7_bar_2_bar_60) 23)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_60) 13)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_4_bar_7_bar_2_bar_60) 13)
        (= (distance loc_bar__minus_4_bar_7_bar_2_bar_60 loc_bar__minus_6_bar_7_bar_1_bar_60) 6)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_4_bar_7_bar_2_bar_60) 6)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_15_bar_9_bar_3_bar_60) 14)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_8_bar_14_bar_2_bar_60) 14)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_5_bar_10_bar_1_bar_60) 9)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_8_bar_14_bar_2_bar_60) 9)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_5_bar_13_bar_1_bar_60) 6)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_8_bar_14_bar_2_bar_60) 6)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_17_bar_17_bar_2_bar_60) 17)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_8_bar_14_bar_2_bar_60) 17)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_45) 5)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_8_bar_14_bar_2_bar_60) 5)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_16_bar_14_bar_3_bar_60) 10)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_8_bar_14_bar_2_bar_60) 10)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_60) 4)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_8_bar_14_bar_2_bar_60) 4)
        (= (distance loc_bar__minus_8_bar_14_bar_2_bar_60 loc_bar__minus_6_bar_7_bar_1_bar_60) 11)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_8_bar_14_bar_2_bar_60) 11)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_5_bar_10_bar_1_bar_60) 14)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_15_bar_9_bar_3_bar_60) 14)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_5_bar_13_bar_1_bar_60) 17)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_15_bar_9_bar_3_bar_60) 17)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_17_bar_17_bar_2_bar_60) 14)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_15_bar_9_bar_3_bar_60) 14)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_45) 18)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_15_bar_9_bar_3_bar_60) 18)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_16_bar_14_bar_3_bar_60) 9)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_15_bar_9_bar_3_bar_60) 9)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_60) 17)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_15_bar_9_bar_3_bar_60) 17)
        (= (distance loc_bar__minus_15_bar_9_bar_3_bar_60 loc_bar__minus_6_bar_7_bar_1_bar_60) 14)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_15_bar_9_bar_3_bar_60) 14)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_5_bar_13_bar_1_bar_60) 6)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_5_bar_10_bar_1_bar_60) 6)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_17_bar_17_bar_2_bar_60) 23)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_5_bar_10_bar_1_bar_60) 23)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_45) 11)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_5_bar_10_bar_1_bar_60) 11)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_16_bar_14_bar_3_bar_60) 18)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_5_bar_10_bar_1_bar_60) 18)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_60) 10)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_5_bar_10_bar_1_bar_60) 10)
        (= (distance loc_bar__minus_5_bar_10_bar_1_bar_60 loc_bar__minus_6_bar_7_bar_1_bar_60) 9)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_5_bar_10_bar_1_bar_60) 9)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_17_bar_17_bar_2_bar_60) 20)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_5_bar_13_bar_1_bar_60) 20)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_45) 8)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_5_bar_13_bar_1_bar_60) 8)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_16_bar_14_bar_3_bar_60) 15)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_5_bar_13_bar_1_bar_60) 15)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_60) 7)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_5_bar_13_bar_1_bar_60) 7)
        (= (distance loc_bar__minus_5_bar_13_bar_1_bar_60 loc_bar__minus_6_bar_7_bar_1_bar_60) 12)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_5_bar_13_bar_1_bar_60) 12)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_45) 17)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_17_bar_17_bar_2_bar_60) 17)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_16_bar_14_bar_3_bar_60) 8)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_17_bar_17_bar_2_bar_60) 8)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_60) 16)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_17_bar_17_bar_2_bar_60) 16)
        (= (distance loc_bar__minus_17_bar_17_bar_2_bar_60 loc_bar__minus_6_bar_7_bar_1_bar_60) 23)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_17_bar_17_bar_2_bar_60) 23)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_16_bar_14_bar_3_bar_60) 14)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_45) 14)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_6_bar_14_bar_1_bar_60) 2)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_45) 2)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_45 loc_bar__minus_6_bar_7_bar_1_bar_60) 11)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_45) 11)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_60) 13)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_16_bar_14_bar_3_bar_60) 13)
        (= (distance loc_bar__minus_16_bar_14_bar_3_bar_60 loc_bar__minus_6_bar_7_bar_1_bar_60) 20)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_16_bar_14_bar_3_bar_60) 20)
        (= (distance loc_bar__minus_6_bar_14_bar_1_bar_60 loc_bar__minus_6_bar_7_bar_1_bar_60) 10)
        (= (distance loc_bar__minus_6_bar_7_bar_1_bar_60 loc_bar__minus_6_bar_14_bar_1_bar_60) 10)
        (receptacleAtLocation Drawer__minus_17_dot_733296_comma__minus_17_dot_733296_comma_13_dot_37799932_comma_13_dot_37799932_comma_1_dot_8938998_comma_1_dot_8938998 loc_bar__minus_14_bar_11_bar_3_bar_45)
        (receptacleAtLocation ArmChair__minus_3_dot_504_comma__minus_3_dot_504_comma_2_dot_264_comma_2_dot_264_comma__minus_0_dot_1316_comma__minus_0_dot_1316 loc_bar__minus_4_bar_7_bar_2_bar_60)
        (receptacleAtLocation Shelf__minus_1_dot_85999584_comma__minus_1_dot_85999584_comma_12_dot_15600204_comma_12_dot_15600204_comma_0_dot_6968_comma_0_dot_6968 loc_bar__minus_6_bar_14_bar_1_bar_60)
        (receptacleAtLocation Shelf__minus_1_dot_346000672_comma__minus_1_dot_346000672_comma_10_dot_696_comma_10_dot_696_comma_0_dot_7032_comma_0_dot_7032 loc_bar__minus_6_bar_8_bar_1_bar_45)
        (receptacleAtLocation Shelf__minus_1_dot_85999584_comma__minus_1_dot_85999584_comma_12_dot_15600204_comma_12_dot_15600204_comma_1_dot_6748_comma_1_dot_6748 loc_bar__minus_6_bar_14_bar_1_bar_45)
        (receptacleAtLocation Shelf__minus_1_dot_846003892_comma__minus_1_dot_846003892_comma_9_dot_21560192_comma_9_dot_21560192_comma_1_dot_9108_comma_1_dot_9108 loc_bar__minus_5_bar_10_bar_1_bar_60)
        (receptacleAtLocation Shelf__minus_1_dot_860004_comma__minus_1_dot_860004_comma_9_dot_21760176_comma_9_dot_21760176_comma_0_dot_7012_comma_0_dot_7012 loc_bar__minus_6_bar_7_bar_1_bar_60)
        (receptacleAtLocation Shelf__minus_1_dot_85999584_comma__minus_1_dot_85999584_comma_12_dot_15600204_comma_12_dot_15600204_comma_2_dot_2752_comma_2_dot_2752 loc_bar__minus_5_bar_13_bar_1_bar_60)
        (receptacleAtLocation CoffeeTable__minus_7_dot_892_comma__minus_7_dot_892_comma_10_dot_4616_comma_10_dot_4616_comma_0_dot_0084_comma_0_dot_0084 loc_bar__minus_4_bar_11_bar_3_bar_60)
        (receptacleAtLocation Sofa__minus_8_dot_5_comma__minus_8_dot_5_comma_18_dot_232_comma_18_dot_232_comma__minus_0_dot_016_comma__minus_0_dot_016 loc_bar__minus_10_bar_13_bar_0_bar_45)
        (receptacleAtLocation Sofa__minus_18_dot_28_comma__minus_18_dot_28_comma_7_dot_6_comma_7_dot_6_comma__minus_0_dot_016_comma__minus_0_dot_016 loc_bar__minus_13_bar_8_bar_3_bar_45)
        (receptacleAtLocation SideTable__minus_18_dot_452_comma__minus_18_dot_452_comma_13_dot_3852_comma_13_dot_3852_comma_0_dot_024_comma_0_dot_024 loc_bar__minus_17_bar_17_bar_2_bar_60)
        (receptacleAtLocation GarbageCan__minus_0_dot_90916252_comma__minus_0_dot_90916252_comma_19_dot_11539076_comma_19_dot_11539076_comma_0_dot_023272708_comma_0_dot_023272708 loc_bar__minus_1_bar_17_bar_0_bar_60)
        (objectAtLocation KeyChain__minus_17_dot_916536_comma__minus_17_dot_916536_comma_13_dot_55398084_comma_13_dot_55398084_comma_2_dot_049388172_comma_2_dot_049388172 loc_bar__minus_16_bar_14_bar_3_bar_60)
        )


        (:goal
            (and
                (exists (?r - receptacle)
                    (exists (?o - object)
                        (and 
                            (inReceptacle ?o ?r) 
                            (objectType ?o KeyChainType) 
                            (receptacleType ?r SofaType)
                        )
                    )
                )
                (forall (?re - receptacle)
                    (not (opened ?re))
                )
            )
        )
    )
    