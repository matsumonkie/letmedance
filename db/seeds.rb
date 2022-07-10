events =
  [ Event.new(title: "L.A WEST - Le Bal Pop'",
              description: "Initiation à 20h, vous pouvez venir seul(e) ou accompagné(e) ✨"\
                           "🚨 Entrée à 5€"\
                           "🚨 Bar dansant 🍻"\
                           "Une magnifique communauté de danseurs, une atmosphère surprenante, de belles rencontres en perspective 👌"\
                           "🎶 Quels sons ?"\
                           "~> Le gros + du WCS : Nous dansons sur des musiques actuelles (R&B, Pop, Blues, Latino...)."\
                           "N'hésitez pas à en parler autour de vous 😉",
              start_at_date: Time.now - 5.days,
              image: 'l_a_west.png'),

    Event.new(title: "MyDanceOnWest",
              description: "Soirée de stage de 21h et jusqu’à 2h."\
                           "Entrée exceptionnellement à 6 euros avec ecocup + boissons + friandises"\
                           "(Nous avons pris la décision pour cette année de ne plus fournir de gobelets jetables )😄😄"\
                           "Si vous pouviez prévoir l’appoint ce serait super cela nous soulagerait 😘😘"\
                           "Hâte de vous retrouver💃🏻🕺💃🏻🕺"\
                           "Pascale et Jean Pierre 🎼,",
              start_at_date: Time.now - 2.days,
              image: 'my_dance_on_west.jpg'),

    Event.new(title: "44 Dance Studio",
              description: "Le 44 Danse Studio Nantes vous propose sa dernière pratique 100% WCS de la saison"\
                           "Participation 9€ avec boissons soft et friandises"\
                           "Soirée ouverte à tous de 21h30 à 1h30"\
                           "Studio Nantes Sud,",
              start_at_date: Time.now - 2.days,
              image: 'connect_and_swing.jpg'),

    Event.new(title: "Après-midi dansant West Coast Swing",
              description: "L’entrée est à 5 euros."\
                           "Comme d’habitude on aime bien avoir l’appoint (et pas de gros billets) 😅"\
                           "Nous prévoyons quelques boissons et petites friandises. Merci d’amener votre gobelet."\
                           "À dimanche",
              start_at_date: Time.now,
              image: 'connect_and_swing.jpg')
  ]

events.each(&:save)
