require 'ruby-hackernews'

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    entries = RubyHackernews::Entry.all

    if entries
      entries = entries.map do |entry|
        {
            title: entry.link.title,
            score: entry.voting.score,
        }
      end
      send_event('hackernews', { entries: entries })
    end
  end
end
