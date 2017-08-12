# frozen_string_literal: true

every 1.minute do
  rake 'fave:generate_weekly_statements'
end
