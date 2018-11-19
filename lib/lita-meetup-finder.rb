require "lita"

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require "lita/handlers/meetup_finder"
require "lita/meetup_result"

Lita::Handlers::MeetupFinder.template_root File.expand_path(
  File.join("..", "..", "templates"),
 __FILE__
)
