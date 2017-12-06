AlgoliaSearch.configuration = {
  application_id: ENV['APPLICATION_ID'],
  api_key: ENV['API_KEY'],
  # Additional option for Algolia
  connect_timeout: 2,
  receive_timeout: 30,
  send_timeout: 30,
  batch_timeout: 120,
  search_timeout: 5
}
