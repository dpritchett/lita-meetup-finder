module Lita
    class MeetupResult
        # START:init
        def initialize(raw_result)
            @raw_result = raw_result

            @name = raw_result.fetch('name')
            @url = raw_result.fetch('event_url')
            @group_name = raw_result.fetch('group').fetch('name')
        end
        # END:init

        # START:attrs
        # expose instance variables as attribute getters
        attr_reader :raw_result, :name, :url, :group_name
        # END:attrs

        # START:start_time
        # Human readable start time for the event
        #   Raw time:   1541941200000 
        #   Human time: Sun Nov 11 07:00:00 2018
        def start_time
            # API results are in milliseconds since the unix epoch
            epoch_msec = raw_result.fetch('time')
            epoch_sec = epoch_msec / 1000

            Time.at(epoch_sec).ctime
        end
        # END:start_time

        # START:tagline
        def tagline
            "#{name} >> Group: #{group_name} >> #{start_time} >> #{url}"
        end
        # END:tagline
    end
end