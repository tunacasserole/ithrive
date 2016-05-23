desc "Run all files in db/seeds directory"

namespace :db do
  task seed: :environment do
    Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].each do |filename|
      puts "seeding - #{filename} for reals, yo!"
      load(filename) #if File.exist?(filename)
    end
  end

  task build: :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end
