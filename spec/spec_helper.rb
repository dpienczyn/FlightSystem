RSpec.configure do |config|
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.example_status_persistence_file_path = 'tmp/spec_results.txt'
  config.profile_examples = nil
  config.order = :random

  config.filter_run_when_matching(:focus)
  config.disable_monkey_patching!

  config.expect_with(:rspec) do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with(:rspec) do |mocks|
    mocks.verify_partial_doubles = true
  end

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  Kernel.srand(config.seed)
end
