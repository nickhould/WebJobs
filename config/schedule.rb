
every 6.hours do
  rake "fetch_all_jobs"
  rake "db:migrate"
end

