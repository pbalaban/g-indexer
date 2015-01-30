Dir[Rails.root.join('lib/**/*.rb')].each{ |file| load file }
Dir[Rails.root.join('app/jobs/*.rb')].each{ |file| load file }
