# frozen_string_literal: true

album_infos = 100.times.flat_map do |i|
  10.times.map do |j|
    ["Album #{i}", j, "Artist #{j}"]
  end
end

album_artists = album_infos.flat_map(&:last)
album_artists.uniq!

lookup = -> (artists) do
  album_artists & artists
end

pp lookup.call(["Artist 7", "Artist 9", "Artist X"])
