Set Up:
- install ruby 1.9.2 (make sure your ruby/bin folder is in PATH)
- install rubygems
- install Ruby Devkit (download, run ruby dk.rb install)
- install rest_client gem (gem install rest_client)
- install json gem (gem install json)
- run test from the root folder with "ruby test_AlternateFuelAPI.rb"

Issues:

- I need a better runner that will integrate with CI.

- The API would not accept id as a parameter, but I was able to verify the station's address in the same test as the initial request.

- API key should be saved in a common place.

- I need real asserts.