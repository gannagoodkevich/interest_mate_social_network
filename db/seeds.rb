interest_categories = %w[Science Design Games Movies Music Live\ events Books Art Food Travel]
interest_categories.each do |interest_category|
  InterestCategory.create!(category_name: interest_category)
end

science_interests = %w[Mathematics Statistics Physics Chemistry Ecology Biology  Social\ sciences Medicine]
science_interests.each do |interest|
  InterestCategory.find_by_category_name('Science').interests.create!(name: interest)
end

design_interests = %w[Fashion\ design Graphic\ design Interior\ design]
design_interests.each do |interest|
  InterestCategory.find_by_category_name('Design').interests.create!(name: interest)
end

games_interests = %w[Board\ games Card\ games Online\ games Puzzle\ games Role-playing\ games Shooter\ games Simulation\ games Sports\ games Strategy\ games Video\ games]
games_interests.each do |interest|
  InterestCategory.find_by_category_name('Games').interests.create!(name: interest)
end

movies_interests = %w[Action\ movies Animated\ movies Anime\ movies Bollywood\ movies Comedy\ movies Documentary\ movies Drama\ movies Fantasy\ movies Horror\ movies Musical\ theatre Science\ fiction\ movies Thriller\ movies]
movies_interests.each do |interest|
  InterestCategory.find_by_category_name('Movies').interests.create!(name: interest)
end

music_interests = %w[Blues\ music Classical\ music Country\ music Dance\ music Electronic\ music Gospel\ music Heavy\ metal\ music Hip\ hop\ music Jazz\ music LoFi\ music Music\ videos Pop\ music Rhythm\ and\ blues\ music Rock\ music Soul\ music]
music_interests.each do |interest|
  InterestCategory.find_by_category_name('Music').interests.create!(name: interest)
end

live_events_interests = %w[Ballet Bars Concerts Dancehalls Music\ festivals Nightclubs Parties Plays Theatre]
live_events_interests.each do |interest|
  InterestCategory.find_by_category_name('Live events').interests.create!(name: interest)
end

books_interests = %w[Fiction\ books Comics E-books Fiction\ books Literature Magazines Manga Mystery\ fiction Newspapers Non-fiction\ books Romance\ novels]
books_interests.each do |interest|
  InterestCategory.find_by_category_name('Books').interests.create!(name: interest)
end

art_interests = %w[Acting Crafts Dance Drawing Drums Fine\ art Guitar Painting Performing Photography Sculpture Singing Writing]
art_interests.each do |interest|
  InterestCategory.find_by_category_name('Art').interests.create!(name: interest)
end

food_interests = %w[Barbecue Chocolate Desserts Fast\ food Organic\ food Pizza Seafood Veganism Vegetarianism]
food_interests.each do |interest|
  InterestCategory.find_by_category_name('Food').interests.create!(name: interest)
end

travel_interests = %w[Adventure\ travel Air\ travel Beaches Car\ rentals Cruises Ecotourism Hotels Lakes Mountains Nature Theme\ parks Tourism Vacations]
travel_interests.each do |interest|
  InterestCategory.find_by_category_name('Travel').interests.create!(name: interest)
end
